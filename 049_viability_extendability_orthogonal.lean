-- ID 049: Viability and Extendability Are Orthogonal
--
-- Catalog ID 49 (Non-Locality of Extendability paper).
-- Concrete witness for NEO Remark 12.
--
-- Statement: there exist concrete partial trajectories where the current
-- state is in the viability kernel — at least one action keeps the state
-- within the ongoing state constraint indefinitely — yet the prefix is
-- already non-extendable with respect to the terminal constraint, because
-- the accumulated history has foreclosed all globally consistent
-- completions. Viability is a property of the current state under
-- ongoing state constraints; extendability is a property of the prefix
-- under terminal constraints. The two properties are not equivalent and
-- do not reduce to each other in either direction.
--
-- Witness: action set U = {0, 1, 2}, running sum xₜ = Σuᵢ, state
-- constraint xₜ ≤ 20, terminal constraint Σuₜ = 7 over T = 5 steps.
-- At step t = 4 with running sum 9: the state is viable (action 0
-- preserves xₜ ≤ 20 indefinitely), but the prefix is non-extendable
-- (any one-step completion gives total ≥ 9 > 7).
--
-- Corresponds to Remark 12 of:
--   "The Non-Locality of Extendability: An Impossibility Theorem for
--    Bounded Information Systems, with Applications to Generative
--    Sequential Systems"
--
-- Shawn Kevin Jason

import Mathlib.Tactic

/-- The concrete action set U = {0, 1, 2} encoded as Fin 3.
    Action k corresponds to numerical value k. -/
def actionValue (u : Fin 3) : ℕ := u.val

/-- State viability under the ongoing constraint xₜ ≤ 20: action 0 always
    preserves the constraint, since taking action 0 leaves the running
    sum unchanged. From any state with xₜ ≤ 20, action 0 keeps the next
    state within the constraint. -/
theorem viable_state_at_9 :
    ∀ x : ℕ, x ≤ 20 → x + actionValue 0 ≤ 20 := by
  intro x hx
  simp [actionValue]
  exact hx

/-- Stronger viability: from running sum 9, every available action
    preserves xₜ ≤ 20 (since 9 + 2 = 11 ≤ 20). The state is in the
    viability kernel under any action choice. -/
theorem viable_state_at_9_all_actions :
    ∀ u : Fin 3, 9 + actionValue u ≤ 20 := by
  intro u
  unfold actionValue
  have : u.val < 3 := u.isLt
  omega

/-- Non-extendability: from prefix sum 9 with one step remaining and
    actions in {0, 1, 2}, no single-step completion reaches terminal
    sum 7. Every completion yields total ≥ 9, but the target is 7. -/
theorem non_extendable_from_9 :
    ¬ ∃ u : Fin 3, 9 + actionValue u = 7 := by
  rintro ⟨u, hu⟩
  unfold actionValue at hu
  have : u.val < 3 := u.isLt
  omega

/-- The orthogonality witness: at running sum 9 with one step remaining,
    the state is viable under every action (preserves xₜ ≤ 20) yet the
    prefix is non-extendable (no action reaches the terminal target 7).
    Viability and extendability come apart on this concrete instance. -/
theorem viability_and_extendability_orthogonal :
    (∀ u : Fin 3, 9 + actionValue u ≤ 20) ∧
    (¬ ∃ u : Fin 3, 9 + actionValue u = 7) := by
  exact ⟨viable_state_at_9_all_actions, non_extendable_from_9⟩