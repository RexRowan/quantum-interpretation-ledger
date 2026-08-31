# Database

This repo vendors its own reference bibliography — it does not depend on
the external `quantum-interpretations-survey` repo at runtime or at build
time. (An earlier version of this file said the opposite; that was wrong
and has been corrected here.)

Each claim's Lean file (`Ledger/Interpretations/*.lean`,
`Ledger/SimulationSignatures/*.lean`) carries the specific citation its
axioms or falsification hypothesis draws on, directly in its doc comment
— author/year, arXiv id or journal reference, and the specific numeric
bound where one is used in a theorem. That comment is the canonical,
self-contained copy. `manifest.yaml`'s `note` field carries a short
version of the same citation for the `RESULTS.md` table; it should match
the Lean file's comment, not introduce a third, divergent copy.

If a new claim's citation isn't already covered by an existing Lean file,
add it there directly rather than pointing out to `quantum-interpretations-survey`
— that keeps the logical claim (the Lean theorem) and the empirical claim
(the citation) traceable to two independently reviewable places *within
this repo*, without a live dependency on another one.
