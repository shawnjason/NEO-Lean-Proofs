# Non-Locality of Extendability — Lean Proofs

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19687799.svg)](https://doi.org/10.5281/zenodo.19687799)

Machine-checked Lean 4 proofs for:

**"The Non-Locality of Extendability: An Impossibility Theorem for Bounded Information Systems, with Applications to Generative Sequential Systems"**

Paper DOI (concept, always resolves to latest): [10.5281/zenodo.19688367](https://doi.org/10.5281/zenodo.19688367)

---

## Author

Shawn Kevin Jason — Independent Researcher, Las Vegas, NV
ORCID: [![ORCID iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0009-0003-9208-1556) [0009-0003-9208-1556](https://orcid.org/0009-0003-9208-1556)

---

## What This Repository Contains

Five standalone Lean 4 proofs covering the mathematical core of the Non-Observability of Extendability (NEO) theorem and its principal consequences. Each file is independent and verifies against the current Mathlib release.

The proofs verify the logical skeleton of the stated results — the set-theoretic and arithmetic structure underlying NEO's adversarial construction. The full policy-level impossibility arguments, empirical instantiation, and cross-domain AI applications are established in the associated paper.

---

## Files

| File | Paper Result |
|------|-------------|
| `extendability_indistinguishability.lean` | Divergence lemma: two states with identical bounded projections that differ in extendability |
| `horizon_nonconvergence.lean` | Non-Convergence of Horizon corollary: for every horizon h, a separating pair exists at depth h+1 |
| `admissible_set_monotone_discrete.lean` | Admissible-set monotonicity along any trajectory: A_{t+1} ⊆ A_t |
| `forced_inconsistency.lean` | Arithmetic core of the forced inconsistency construction |
| `participation_invariance.lean` | Structural basis for the constraint requirement at the depletion boundary |

---

## How to Verify

1. Open [live.lean-lang.org](https://live.lean-lang.org)
2. Confirm the dropdown in the upper right is set to **Latest Mathlib**
3. Paste the contents of any `.lean` file into the editor
4. Wait for checking to complete — "No goals" on each theorem and no errors in the Problems pane confirms verification

Each file is independent; no cross-file imports are required.

---

## Scope

These proofs verify the formal logical structure of the stated results — the set-theoretic and arithmetic cores underlying NEO. They do not establish:

- The full policy-level impossibility arguments (developed in Sections 3–4 of the paper)
- The empirical constructive instantiation over 30,000 episodes across 16 configurations (Section 6)
- The cross-domain unification across planning, reinforcement learning, and language generation (Section 5)

These are established in the associated paper.

---

## Related Work

The foundational projection-theoretic result of which NEO is a forward-case specialization is developed in:

*Projection Insufficiency and Trajectory Realization: A Unified Constraint-Based Framework for Bounded Systems* — [DOI: 10.5281/zenodo.19633241](https://doi.org/10.5281/zenodo.19633241) (Lean proofs: [10.5281/zenodo.19687629](https://doi.org/10.5281/zenodo.19687629))

The stochastic extension of the NEO result, with a quantitative inconsistency-accumulation lower bound and a matching positive representational theorem, is developed in:

*Inconsistency Accumulation in Forward-Local Sequential Policies: A Lower Bound under Delayed Constraints* — [DOI: 10.5281/zenodo.19688628](https://doi.org/10.5281/zenodo.19688628) (Lean proofs: [10.5281/zenodo.19687094](https://doi.org/10.5281/zenodo.19687094))

---

## License

MIT
