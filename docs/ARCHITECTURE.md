# Architecture

## Why falsification, not confirmation

A proof assistant derives theorems from axioms via valid deduction. It has
no native way to represent "this experiment confirms hypothesis X" —
that's a statistical/Bayesian relation between evidence and a theory, not
a proof-theoretic one. Many-Worlds in particular is empirically equivalent
to bare unitary QM: there is no experiment whose outcome a formal system
could point to and say "MWI, not Copenhagen."

What *is* tractable in a proof assistant is falsification: given an
interpretation's axioms and an asserted experimental fact, does the
combination derive a contradiction? Objective-collapse models (GRW, CSL,
Diósi–Penrose) are the productive case here — they have explicit
parameters (collapse rate, correlation length, collapse time) with
published experimental bounds. Ruling those out, one by one, is how this
project makes progress: not by proving Many-Worlds true, but by narrowing
the set of alternatives it has to survive against.

## Core definitions (`Ledger/Core.lean`)

- `Interpretation` — a structure capturing an interpretation's
  distinguishing axioms: whether it has a collapse mechanism, whether
  it's local, whether it's deterministic, plus whatever model-specific
  parameters it needs (subtypes extend this, e.g. `CSL` adds `lambda`
  and `rC`).
- An experimental result is never a Lean-derived fact — it's asserted as
  a hypothesis (a `Prop` taken as a premise), because Lean can't measure
  anything. The hypothesis's content comes from
  [quantum-interpretations-survey](../quantum-interpretations-survey);
  this repo doesn't re-derive experimental physics, it formalizes the
  logical consequence of taking a published result as given.
- `Falsified I P` — the pattern used for falsification theorems: derive
  `False` from an interpretation's axioms combined with an asserted
  experimental hypothesis `P`.

## Per-interpretation files (`Ledger/Interpretations/`)

One file per interpretation. Each defines:

1. The interpretation's axiom-set as a `Interpretation` (or an extending
   structure, for parameterized models).
2. Falsification theorems, where applicable, each citing the specific
   survey entry / experimental bound it uses as a hypothesis.
3. A status comment (`Pending` / `Falsified` / `Constrained` /
   `Out of scope`) matching its entry in `manifest.yaml`.

## Status pipeline

`manifest.yaml` is the source of truth. `scripts/gen_results.py` reads it
and regenerates the table in `RESULTS.md`. CI runs `lake build` (does the
Lean code typecheck / do the claimed theorems actually hold) and then
regenerates `RESULTS.md` — so the status page can't silently drift from
what's actually formalized.

## Adding a new falsification result

1. Add or extend the relevant file in `Ledger/Interpretations/`.
2. State the theorem: axioms + asserted experimental hypothesis → `False`.
3. Close the proof (no `sorry` left).
4. Update that interpretation's entry in `manifest.yaml`: set `status:
   falsified` and `theorem: <theorem name>`.
5. Run `python scripts/gen_results.py` (or let CI do it) to regenerate
   `RESULTS.md`.
