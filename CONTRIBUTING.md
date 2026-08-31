# Contributing

## Adding a new interpretation or simulation-theory claim

Same pattern for both axiom-set families — use `Ledger/Interpretations/`
for QM interpretations, `Ledger/SimulationSignatures/` for simulation-theory
claims.

1. Create `Ledger/Interpretations/<Name>.lean` (or
   `Ledger/SimulationSignatures/<Name>.lean`).
2. Define its axiom-set as an `Interpretation` if it's a QM interpretation
   (extend it with a new structure if the model needs parameters — see
   `CSL.lean` for the pattern), or as a `Postulate` if it's a
   simulation-theory claim that doesn't fit `Interpretation`'s fields.
3. Add the import to `Ledger.lean`.
4. Add an entry to `manifest.yaml` with `status: pending` (or
   `out-of-scope` if the claim is not falsifiable in principle — say so
   plainly, don't leave it as `pending` indefinitely).
5. Cite the source directly in the new file's doc comment — see
   `db/README.md` for why this repo vendors its own bibliography instead
   of pointing out to another repo.

## Adding a falsification theorem

1. Identify the survey entry (experiment + bound) you're formalizing.
2. State the theorem in `Ledger/Interpretations/<Name>.lean`: the
   interpretation's axioms plus an asserted hypothesis for the
   experimental result should derive `False`.
3. Prove it — no `sorry` in anything merged to `main`. Partial proofs
   belong on a branch or behind an explicit `-- WIP` comment, not merged
   as if complete.
4. Update `manifest.yaml`: `status: falsified`, `theorem: <name>`.
5. Regenerate `RESULTS.md` (`python scripts/gen_results.py`) — CI checks
   this is in sync and will fail the build if it's stale.

## What doesn't belong here

- Confidence levels, probabilities, or "likely true" language for
  unfalsified interpretations. Pending means pending — not "probably
  correct."
- Informal arguments standing in for a proof. If it can't be stated as a
  Lean theorem yet, its status is `pending` or `constrained`, not
  `falsified`.
