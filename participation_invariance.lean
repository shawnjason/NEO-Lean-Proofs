import Mathlib.Tactic

-- Participation Invariance
-- The selection operator W_t remains defined even when choice magnitude → 0
-- Shawn Kevin Jason

theorem participation_invariance
    (α : Type)
    (A_t : Finset α)
    (h_nonempty : A_t.Nonempty) :
    ∃ x : α, x ∈ A_t := by
  exact h_nonempty

theorem participation_invariance_singleton
    (α : Type)
    (A_t : Finset α)
    (h_singleton : A_t.card = 1) :
    A_t.Nonempty := by
  exact Finset.card_pos.mp (by omega)