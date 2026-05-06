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

Seven standalone Lean 4 proof files covering the principal formal results of the paper. The proofs split into three groups: a **forward-indistinguishable divergence** group containing the load-bearing kernel lemma and its horizon non-convergence corollary; a **structural lemmas** group covering the arithmetic core of the forced-inconsistency construction, admissible-set monotonicity, and the participation invariance underlying the depletion-boundary argument; and a **defensive distinctions** group establishing through concrete witnesses that NEO is not reducible to POMDP-style partial observability or to viability-based formulations.

Each file is independent and verifies against the current Mathlib release.

---

## Files

### Forward-Indistinguishable Divergence

**`031_extendability_indistinguishability.lean`** — Lemma 2 (Forward-Indistinguishable Divergence)
The load-bearing kernel of the impossibility argument. Two prefixes share an identical bounded horizon projection but differ in extendability under a terminal constraint: with target sum 7 and remaining budget, prefix sum 7 admits a zero-completion (extendable) while prefix sum 8 does not. This divergence witness is the structural fact on which the rest of the impossibility argument is built.

**`036_horizon_nonconvergence.lean`** — Corollary 7 (Non-Convergence of Horizon)
For every horizon `h`, a separating pair exists at depth `h+1`: two states with identical bounded horizon projections that differ in extendability can be constructed at any horizon depth. No finite evaluation horizon eliminates the failure class.

### Structural Lemmas

**`039_participation_invariance.lean`** — Participation Invariance
Structural precondition for the Constraint Requirement at the depletion boundary. A non-empty admissible set contains at least one element, and a singleton admissible set is non-empty (`participation_invariance_singleton`). These are minimal but load-bearing facts on which the depletion-boundary argument depends.

**`046_forced_inconsistency.lean`** — Forced Inconsistency Arithmetic Core
Once a prefix sum exceeds a target, no nonnegative completion can reduce it back to the target (`forced_inconsistency`). The companion (`admissible_action_preserved`) formalizes the dual: a prefix sum equal to the target is trivially completable with a zero-length completion. The two clauses together capture the arithmetic substrate of the witness family.

**`047_admissible_set_monotone_discrete.lean`** — Admissible-Set Monotone Refinement
Along any admissible trajectory, the admissible set is monotonically non-increasing: `A_{t+1} ⊆ A_t` at every step. The companion theorem (`admissible_set_strict_decrease`) characterizes when the inclusion is strict — strict shrinkage corresponds to commitment, equality means the step preserved all options.

### Defensive Distinctions

**`033_neo_distinct_from_partial_observability.lean`** — Remark 4 (NEO Is Not Partial Observability)
Concrete witness showing that even with complete observation of the current state, two trajectories with identical current observable states can differ in extendability — extendability depends on history outside the current observation. The file constructs two trajectories `τ1`, `τ2` with identical current observation and proves one extendable and the other non-extendable, ruling out any reduction of NEO to POMDP-style partial observability.

**`049_viability_extendability_orthogonal.lean`** — Remark 12 (Viability and Extendability Are Orthogonal)
Concrete witness: there exist partial trajectories where the current state is in the viability kernel — at least one action keeps the state within the ongoing state constraint indefinitely — yet the prefix is non-extendable to a terminal target. The file constructs the witness at running sum 9 and proves the full set of orthogonality facts (state viable, viable under all actions, non-extendable from current, viability and extendability orthogonal in general).

---

## Mapping to the Paper

| Paper Result | File | Lean Theorem |
|---|---|---|
| Lemma 2 (Forward-Indistinguishable Divergence) | `031_extendability_indistinguishability.lean` | `extendability_indistinguishability` |
| Corollary 7 (Non-Convergence of Horizon) | `036_horizon_nonconvergence.lean` | `horizon_nonconvergence` |
| Participation Invariance | `039_participation_invariance.lean` | `participation_invariance`, `participation_invariance_singleton` |
| Forced Inconsistency Arithmetic Core | `046_forced_inconsistency.lean` | `forced_inconsistency`, `admissible_action_preserved` |
| Admissible-Set Monotone Refinement | `047_admissible_set_monotone_discrete.lean` | `admissible_set_monotone`, `admissible_set_strict_decrease` |
| Remark 4 (NEO Distinct from Partial Observability) | `033_neo_distinct_from_partial_observability.lean` | `neo_distinct_from_partial_observability` |
| Remark 12 (Viability and Extendability Orthogonal) | `049_viability_extendability_orthogonal.lean` | `viability_and_extendability_orthogonal` |

---

## How to Verify

1. Open [live.lean-lang.org](https://live.lean-lang.org)
2. Confirm the dropdown in the upper right is set to **Latest Mathlib**
3. Paste the contents of any `.lean` file into the editor
4. Wait for checking to complete — "No goals" on each theorem and no errors in the Problems pane confirms verification

Each file is independent; no cross-file imports are required.

---

## Scope

These proofs verify the formal logical structure of the stated results — the divergence kernel underlying NEO Lemma 2, the horizon non-convergence corollary, the structural admissibility-set lemmas, and the defensive distinctions establishing that NEO is not reducible to POMDP-style partial observability or to viability-based formulations. They do not establish:

- The full policy-level impossibility argument (NEO Theorem 3, developed in Sections 3–4 of the paper)
- The empirical constructive instantiation over 30,000 episodes across 16 configurations (Section 6)
- The cross-domain unification across planning, reinforcement learning, and language generation (Section 5)

---

## Related Work

The foundational projection-theoretic result of which NEO is a forward-case specialization is developed in:

*Projection Insufficiency and Trajectory Realization: A Unified Constraint-Based Framework for Bounded Systems* — [DOI: 10.5281/zenodo.19633241](https://doi.org/10.5281/zenodo.19633241) (Lean proofs: [10.5281/zenodo.19687629](https://doi.org/10.5281/zenodo.19687629))

The stochastic extension of the NEO result, with a quantitative inconsistency-accumulation lower bound and a matching positive representational theorem, is developed in:

*Inconsistency Accumulation in Forward-Local Sequential Policies: A Lower Bound under Delayed Constraints* — [DOI: 10.5281/zenodo.19688628](https://doi.org/10.5281/zenodo.19688628) (Lean proofs: [10.5281/zenodo.19687094](https://doi.org/10.5281/zenodo.19687094))

---

## License

MIT
