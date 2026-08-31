# quantum-interpretation-ledger

A formal falsification checker, written in Lean 4, for physical
interpretation questions — tracked against a self-contained reference
bibliography and, where a real falsification exists, an actual Lean
theorem that derives `False` from an interpretation's axioms plus a cited
experimental result.

See [`RESULTS.md`](RESULTS.md) for current status of every tracked claim,
and [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for why falsification
(not confirmation) is the right frame for a proof assistant here, and how
the pieces below fit together.

## Axiom-set families

- **QM interpretations** (`Ledger/Interpretations/`) — Many-Worlds, GRW,
  CSL, Diósi-Penrose, Extended Wigner's Friend / Local Friendliness,
  Bohmian mechanics.
- **Simulation-theory signatures** (`Ledger/SimulationSignatures/`) —
  lattice/discretization signatures (cosmic-ray anisotropy, Lorentz
  invariance violation, Hogan holographic noise), computational-constraint
  signatures (Bekenstein bound, rendering-resolution), and the
  non-falsifiable philosophical arguments (Bostrom trilemma,
  fine-tuning-as-evidence) kept for completeness.

Both families share the same generic falsification machinery in
`Ledger/Core.lean` and report into the same `manifest.yaml` /
`RESULTS.md` pipeline — see Structure below.

## Structure

- `Ledger/Core.lean` — the `Interpretation` structure, the `Falsified`
  pattern, and the generic falsification lemmas
  (`falsified_of_value_exceeds_bound`, `falsified_of_rate_exceeds_bound`)
  that any axiom-set family can reuse.
- `Ledger/Interpretations/*.lean` — one file per QM interpretation:
  its axiom-set, plus a falsification theorem where one is actually
  closed (see `CSL.lean` for the one currently-closed instance).
- `Ledger/SimulationSignatures/*.lean` — one file per simulation-theory
  claim, same pattern, built on the same `Ledger.Core` machinery via a
  lightweight `Postulate` marker (these claims aren't QM interpretations,
  so they don't extend `Interpretation`).
- `manifest.yaml` — the single source of truth for status. Every claim in
  both families has one entry here.
- `scripts/gen_results.py` — regenerates the table in `RESULTS.md` from
  `manifest.yaml`. CI fails if `RESULTS.md` is out of sync — see
  `CONTRIBUTING.md`.
- `docs/ARCHITECTURE.md` — the reasoning behind all of the above.
- `db/README.md` — where the reference bibliography lives (vendored in
  this repo, cited per-claim in each Lean file's doc comment — see that
  file for why).

Previously the objective-collapse reference data lived in a separate repo
([`Experimental-Tests-of-Quantum-Interpretations`](https://github.com/RexRowan/Experimental-Tests-of-Quantum-Interpretations),
now reduced to a standalone interactive demo). That bibliography is
vendored in this repo now — see `db/README.md` — with no external data
dependency.

## Building

```
lake update
lake build        # typechecks everything, including any falsification theorems
lake exe ledger    # smoke test — see RESULTS.md for actual status
python scripts/gen_results.py   # regenerate RESULTS.md after editing manifest.yaml
```
