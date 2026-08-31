# quantum-interpretation-ledger

A formal falsification checker, written in Lean 4, for axiom-sets bearing on
physical interpretation questions — checked against a self-contained
reference database of experiments and proposals.

This repo does **not** treat "which interpretation is right" as a single
question. It tracks separate **axiom-set families**, each with its own
claims, predicted signatures, datasets, and falsification status. A claim is
only in scope here if it is at least in principle falsifiable — claims that
are unfalsifiable by construction (Bohmian trajectory visualization, the
simulation-argument-proper, fine-tuning-as-evidence) are recorded for
completeness but flagged `unfalsifiable` rather than checked.

## Axiom-set families

| Family | Docs | Lean source | Status |
|---|---|---|---|
| Objective collapse (GRW / CSL / Diósi-Penrose) | [`docs/objective-collapse.md`](docs/objective-collapse.md) | [`Ledger/ObjectiveCollapse.lean`](Ledger/ObjectiveCollapse.lean) | active, falsifiable |
| Simulation-theory signatures | [`docs/simulation-theory.md`](docs/simulation-theory.md) | [`Ledger/SimulationTheory.lean`](Ledger/SimulationTheory.lean) | active, mixed falsifiability |

Previously the objective-collapse reference data lived in a separate repo
([`Experimental-Tests-of-Quantum-Interpretations`](https://github.com/RexRowan/Experimental-Tests-of-Quantum-Interpretations),
now reduced to a standalone interactive demo). That data has been migrated
in full into `docs/objective-collapse.md` and `Ledger/ObjectiveCollapse.lean`
— this repo has no external data dependency.

## Structure

- `Ledger/Claim.lean` — the core `Claim` structure and `Status` type shared
  by every axiom-set family.
- `Ledger/ObjectiveCollapse.lean` — the objective-collapse claim list.
- `Ledger/SimulationTheory.lean` — the simulation-theory claim list.
- `Ledger/Checker.lean` — generic falsification-checking functions that
  operate over any `List Claim`.
- `docs/*.md` — human-readable bibliography tables mirroring each Lean file,
  used as the reference database.

## Claim schema

Every claim, regardless of family, is recorded as:

```
postulate            -- the physical claim being tested
predictedSignature   -- what a positive test would look like
datasetOrObservatory -- what could confirm or rule it out
status               -- open | falsified | corroborated | unfalsifiable
reference             -- paper / arXiv id / observatory report
```

This is deliberately the same schema across families so `Ledger/Checker.lean`
never needs to know which family it's operating on.

## Building

```
lake update
lake build
```
