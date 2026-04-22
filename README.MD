# Lean Proofs — The Non-Locality of Extendability

Machine-checked Lean 4 proofs for

**"The Non-Locality of Extendability: An Impossibility Theorem for Bounded Information Systems, with Applications to Generative Sequential Systems"**
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19687799.svg)](https://doi.org/10.5281/zenodo.19687799)

Author
Shawn Kevin Jason — Independent Researcher, Las Vegas, NV ORCID: 0009-0003-9208-1556

---

## What This Repository Contains

Five formally verified Lean 4 proofs covering the mathematical core of the Extendability Non-Locality (NEO) theorem and its principal consequences. Each file is a standalone proof that can be independently verified.

These proofs verify the logical skeleton of the stated results. They cover the foundational set-theoretic and arithmetic structure — not the full policy-level impossibility arguments or empirical claims, which are established in the associated paper.

---

## Files

**`extendability_indistinguishability.lean`**
Concrete witness for extendability indistinguishability: two states with identical bounded projections that differ in extendability. Establishes the core divergence lemma underlying the NEO theorem.

**`horizon_nonconvergence.lean`**
For every horizon h, a separating pair exists at depth h+1. No finite horizon eliminates the failure class. Corresponds to the Non-Convergence of Horizon corollary.

**`admissible_set_monotone_discrete.lean`**
The admissible set is monotone non-increasing along any trajectory: A_{t+1} ⊆ A_t. Establishes the structural basis for admissible-set collapse.

**`forced_inconsistency.lean`**
The arithmetic core of the forced inconsistency construction: once prefix sum exceeds the target, the constraint is unreachable. Covers the arithmetic component of the main constructive witness.

**`participation_invariance.lean`**
The selection operator remains defined even when the admissible set collapses to a singleton. Establishes the structural basis for the constraint requirement at the depletion boundary.

---

## Associated Paper

These proofs correspond to results in:

*The Non-Locality of Extendability: An Impossibility Theorem for Bounded Information Systems, with Applications to Generative Sequential Systems* — submitted to the Journal of Artificial Intelligence Research (JAIR), April 2026.

The foundational projection-theoretic result underlying this paper is established in:

*Projection Insufficiency and Trajectory Realization: A Unified Constraint-Based Framework for Bounded Systems* — Zenodo preprint, DOI: https://doi.org/10.5281/zenodo.19633241

---

## How to Verify

All proofs were verified using the Lean 4 web editor at [live.lean-lang.org](https://live.lean-lang.org) with Latest Mathlib. To verify independently:

1. Open [live.lean-lang.org](https://live.lean-lang.org)
2. Paste the contents of any `.lean` file
3. Wait for Lean to check — "No goals" and "No messages" confirms verification

---

## Scope

These proofs verify the formal logical structure of the stated results. What they establish: the set-theoretic and arithmetic cores are correct. What they do not establish: the full policy-level impossibility arguments or any empirical claims. Those are established in the associated paper under peer review.

---

## Author

Shawn Kevin Jason
Independent Researcher, Las Vegas, NV
ORCID: 0009-0003-9208-1556
