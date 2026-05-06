-- ID 039: Participation Invariance
--
-- Catalog ID 39 (Non-Locality of Extendability paper).
-- Structural precondition for the Constraint Requirement (Corollary 10
-- of NEO) at the depletion boundary.
--
-- Statement: a non-empty admissible set contains at least one element,
-- and a singleton admissible set is non-empty. These are minimal
-- preconditions on the admissible set's existence and selectability,
-- formalizing what it means for the Constraint Requirement to remain
-- operative as the admissible set shrinks toward depletion.
--
-- Why this matters for the framework: NEO's Corollary 10 states that
-- any system guaranteeing consistency-under-extension must incorporate
-- a mechanism whose functional effect is to exclude non-extendable
-- continuations. The simulation analysis (NEO Section 6.4, Pruning
-- Lead) tracks the depletion boundary τ_D — the step at which the
-- admissible set first reaches |A_t| = 1. At this boundary, the
-- Constraint Requirement remains meaningful only if the admissible set
-- is non-empty: an empty admissible set would make the requirement
-- vacuous (nothing to exclude from). Participation invariance is the
-- formal precondition that the requirement applies at every step up
-- to and including the depletion boundary.
--
-- The two theorems together formalize: (a) selectability — a non-empty
-- admissible set yields a selectable element; (b) singleton non-emptiness
-- — at the depletion boundary, the admissible set still contains the
-- single forced action. The selection operator W_t therefore remains
-- defined throughout the trajectory, and the Constraint Requirement
-- has a non-vacuous target at every step.
--
-- Corresponds to the Constraint Requirement structural basis of:
--   "The Non-Locality of Extendability: An Impossibility Theorem for
--    Bounded Information Systems, with Applications to Generative
--    Sequential Systems"
--
-- Shawn Kevin Jason

import Mathlib.Tactic

/-- Participation invariance (selectability form): a non-empty admissible
    set contains at least one element. The selection operator therefore
    has at least one candidate to operate on whenever the admissible set
    is non-empty. -/
theorem participation_invariance
    (α : Type)
    (A_t : Finset α)
    (h_nonempty : A_t.Nonempty) :
    ∃ x : α, x ∈ A_t := by
  exact h_nonempty

/-- Participation invariance (singleton form): a singleton admissible set
    is non-empty. At the depletion boundary τ_D, where |A_t| = 1, the
    admissible set still contains the single forced action, and the
    Constraint Requirement remains operative on it. -/
theorem participation_invariance_singleton
    (α : Type)
    (A_t : Finset α)
    (h_singleton : A_t.card = 1) :
    A_t.Nonempty := by
  exact Finset.card_pos.mp (by omega)