-- ID 033: NEO Is Not Partial Observability
--
-- Catalog ID 33 (Non-Locality of Extendability paper, Remark 4).
-- Defensive consequence distinguishing NEO from POMDP-style results.
--
-- Statement: even with complete observation of the current state, two
-- trajectories with identical current observable states can differ in
-- extendability, because extendability depends on history outside the
-- current state. NEO is therefore not reducible to a partial observability
-- result. The obstruction is non-recoverability of future feasibility from
-- bounded local information, not incomplete estimation of the present
-- state. Belief-state methods that resolve current-state uncertainty do
-- not address the trajectory-level admissibility distinction.
--
-- Witness: action set U = {0, 1, 2}, terminal constraint Σuₜ = 1 over
-- T = 4 steps. Two prefixes of length 3:
--   τ₁ = (1, 0, 0) — running sum 1, extendable (action 0 yields total 1)
--   τ₂ = (2, 0, 0) — running sum 2, non-extendable (any action yields ≥ 2)
-- The current state at the end of each prefix (the most recent observation
-- and current running-sum-modulo-target structure) does not determine
-- extendability; the suppressed pre-window history does.
--
-- Corresponds to Remark 4 of:
--   "The Non-Locality of Extendability: An Impossibility Theorem for
--    Bounded Information Systems, with Applications to Generative
--    Sequential Systems"
--
-- Shawn Kevin Jason

import Mathlib.Tactic

/-- The concrete action set encoded as Fin 3 with values {0, 1, 2}. -/
def actionVal (u : Fin 3) : ℕ := u.val

/-- The current observable state at the end of a prefix: the most recent
    action selected. Two prefixes with the same final action share the
    same current observable state. -/
def currentObservation (τ : List (Fin 3)) : Option (Fin 3) := τ.getLast?

/-- Trajectory τ₁ = (1, 0, 0) — leading action 1, then two zeros. -/
def τ1 : List (Fin 3) := [⟨1, by omega⟩, ⟨0, by omega⟩, ⟨0, by omega⟩]

/-- Trajectory τ₂ = (2, 0, 0) — leading action 2, then two zeros. -/
def τ2 : List (Fin 3) := [⟨2, by omega⟩, ⟨0, by omega⟩, ⟨0, by omega⟩]

/-- The running sum of a trajectory. -/
def runningSum (τ : List (Fin 3)) : ℕ := (τ.map actionVal).sum

/-- Both trajectories share the same current observable state: the final
    action is 0 in both cases. Local observation does not distinguish them. -/
theorem same_current_observation :
    currentObservation τ1 = currentObservation τ2 := by
  rfl

/-- τ₁ has running sum 1. -/
theorem τ1_sum : runningSum τ1 = 1 := by
  unfold runningSum τ1 actionVal
  simp

/-- τ₂ has running sum 2. -/
theorem τ2_sum : runningSum τ2 = 2 := by
  unfold runningSum τ2 actionVal
  simp

/-- τ₁ is extendable to terminal sum 1: take action 0 as the final step,
    yielding total sum 1 + 0 = 1. -/
theorem τ1_extendable :
    ∃ u : Fin 3, runningSum τ1 + actionVal u = 1 := by
  refine ⟨⟨0, by omega⟩, ?_⟩
  rw [τ1_sum]
  rfl

/-- τ₂ is non-extendable to terminal sum 1: with running sum 2 and only
    nonnegative actions available, no completion can reach total 1. -/
theorem τ2_non_extendable :
    ¬ ∃ u : Fin 3, runningSum τ2 + actionVal u = 1 := by
  rintro ⟨u, hu⟩
  rw [τ2_sum] at hu
  unfold actionVal at hu
  omega

/-- The orthogonality witness: τ₁ and τ₂ share the same current
    observable state (their final actions agree) yet differ in
    extendability under the terminal sum constraint. Extendability is
    therefore not a function of the current observable state alone,
    even with full observation of that state. NEO is distinct from
    partial observability: the obstruction lies in the suppressed
    history, not in current-state estimation uncertainty. -/
theorem neo_distinct_from_partial_observability :
    currentObservation τ1 = currentObservation τ2 ∧
    (∃ u : Fin 3, runningSum τ1 + actionVal u = 1) ∧
    (¬ ∃ u : Fin 3, runningSum τ2 + actionVal u = 1) := by
  exact ⟨same_current_observation, τ1_extendable, τ2_non_extendable⟩