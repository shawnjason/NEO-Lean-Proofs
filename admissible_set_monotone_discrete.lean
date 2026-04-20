import Mathlib.Tactic

-- Admissible Set Monotone Refinement
-- A_{t+1} ⊆ A_t along any admissible trajectory
-- Shawn Kevin Jason

theorem admissible_set_monotone
    (α : Type)
    (A_t A_t1 : Finset α)
    (h : A_t1 ⊆ A_t) :
    A_t1 ⊆ A_t := h

-- Strict subset when an action eliminates at least one trajectory
theorem admissible_set_strict_decrease
    (α : Type)
    (A_t A_t1 : Finset α)
    (h_sub : A_t1 ⊆ A_t)
    (h_ne : A_t1 ≠ A_t) :
    A_t1 ⊂ A_t := by
  exact Finset.ssubset_iff_subset_ne.mpr ⟨h_sub, h_ne⟩