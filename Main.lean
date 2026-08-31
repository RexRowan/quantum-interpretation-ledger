import Ledger

/-!
Smoke-test executable: forces every tracked axiom-set file to compile
(catching a broken `Ledger.lean` import list, which is what actually
went stale last time — see git history). It deliberately does not
reimplement a status/results view: `manifest.yaml` is the single source
of truth for status, and `RESULTS.md` (via `scripts/gen_results.py`) is
the generated view of it. Duplicating that here in Lean is exactly the
two-sources-of-truth problem this repo had before.
-/

def main : IO Unit := do
  IO.println "Ledger builds. See RESULTS.md for current falsification status."
