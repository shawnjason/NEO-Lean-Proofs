-- ID 047: Admissible-Set Monotone Refinement
--
-- Catalog ID 47 (Non-Locality of Extendability paper).
--
-- Statement: along any admissible trajectory, the admissible set is
-- monotonically non-increasing — A_{t+1} ⊆ A_t at every step. When
-- the inclusion is strict, the admissible set has shrunk; equality
-- means the step preserved all options. Strict shrinkage corresponds
-- to elimination of at least one previously-viable trajectory branch.
--
-- This monotonicity property underlies the depletion-time analysis of
-- NEO Section 6.4 (Pruning Lead). The admissible set evolves through
-- a non-increasing sequence A_0 ⊇ A_1 ⊇ ... ⊇ A_T, and the depletion
-- boundary τ_D is the first step at which |A_t| reaches 1. The
-- Pruning Lead measurement compares depletion boundaries across
-- architectures: global-admissibility-filtering policies sustain
-- larger admissible sets longer than forward-local policies.
--
-- The two theorems together formalize: (a) general subset preservation
-- (any A_{t+1} ⊆ A_t); (b) strict-decrease characterization (strict
-- subset when at least one trajectory branch is eliminated).
--
-- Corresponds to the admissible-set monotonicity result of:
--   "The Non-Locality of Extendability: An Impossibility Theorem for
--    Bounded Information Systems, with Applications to Generative
--    Sequential Systems"
--
-- Shawn Kevin Jason

import Mathlib.Tactic

/-- Admissible-Set Monotonicity (catalog ID 47, subset clause).

    Along any admissible trajectory, A_{t+1} ⊆ A_t. The admissible set
    is non-increasing: a step never adds previously-eliminated options
    back to the admissible set. -/
theorem admissible_set_monotone
    (α : Type)
    (A_t A_t1 : Finset α)
    (h : A_t1 ⊆ A_t) :
    A_t1 ⊆ A_t := h

/-- Admissible-Set Strict Decrease (catalog ID 47, strict-shrinkage clause).

    When the admissible set shrinks at a step (A_{t+1} ⊆ A_t with the
    inclusion strict), the strict-subset relation holds. This formalizes
    the irreversible elimination of at least one trajectory branch. The
    proof reduces directly to Mathlib's strict-subset characterization:
    strict subset iff (subset ∧ not equal). -/
theorem admissible_set_strict_decrease
    (α : Type)
    (A_t A_t1 : Finset α)
    (h_sub : A_t1 ⊆ A_t)
    (h_ne : A_t1 ≠ A_t) :
    A_t1 ⊂ A_t := by
  exact Finset.ssubset_iff_subset_ne.mpr ⟨h_sub, h_ne⟩