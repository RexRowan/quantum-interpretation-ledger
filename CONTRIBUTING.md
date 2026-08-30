# Contributing

## Adding a new interpretation

1. Create `Ledger/Interpretations/<Name>.lean`.
2. Define its axiom-set as an `Interpretation` (extend it with a new
   structure if the model needs parameters — see `CSL.lean` for the
   pattern).
3. Add the import to `Ledger.lean`.
4. Add an entry to `manifest.yaml` with `status: pending` (or
   `out-of-scope` if the interpretation is not falsifiable in principle —
   say so plainly, don't leave it as `pending` indefinitely).
5. Add a one-line entry to this repo's section of
   [quantum-interpretations-survey](../quantum-interpretations-survey) if
   the interpretation isn't covered there yet.

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
