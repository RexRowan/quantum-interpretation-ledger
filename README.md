# quantum-interpretation-ledger

A Lean 4 formal **falsification checker** for interpretations of quantum
mechanics.

## What this is — and isn't

This is **not** a tool that proves the multiverse exists. No experiment
currently distinguishes Many-Worlds from bare unitary QM, and a proof
assistant can't manufacture that distinction out of deduction rules. What
it *can* do:

1. Encode each interpretation's axioms (ontology, dynamics, locality,
   determinism, and any model parameters) as a Lean structure.
2. Take an experimental result as an asserted hypothesis — Lean can't
   measure anything, so empirical facts enter as premises, sourced from
   [quantum-interpretations-survey](../quantum-interpretations-survey).
3. Mechanically check whether an interpretation's axioms + a given
   experimental hypothesis derive `False` (**falsified**) or remain
   consistent (**survives**).

The result is an elimination argument, not a confirmation: interpretations
that survive every check we've formalized so far aren't "proven true,"
they're "not yet ruled out." See [`RESULTS.md`](./RESULTS.md) for current
status and [`docs/ARCHITECTURE.md`](./docs/ARCHITECTURE.md) for the design
rationale.

## Layout

```
Ledger/                  Lean 4 source
  Core.lean               Interpretation / falsification definitions
  Interpretations/        One file per tracked interpretation
db/                       Pointer to the survey database (not vendored)
docs/ARCHITECTURE.md      Design rationale
scripts/gen_results.py    Regenerates RESULTS.md's table from manifest.yaml
manifest.yaml             Source of truth: status per interpretation
RESULTS.md                Human-readable status page (generated table)
```

## Build

```sh
lake build
```

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for how to add a new
interpretation or wire up a new falsification theorem.

## License

MIT — see [`LICENSE`](./LICENSE).
