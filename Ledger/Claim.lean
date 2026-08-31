/-
  Ledger.Claim

  Core data type shared by every axiom-set family in the ledger. Each
  family (objective collapse, simulation theory, ...) populates a
  `List Claim` in its own file; `Ledger.Checker` operates generically
  over that list without knowing which family it belongs to.
-/

namespace Ledger

/-- Falsification status of a claim, as currently assessed against the
    reference database. `unfalsifiable` is distinct from `open`: it marks
    claims that are not falsifiable even in principle (e.g. the
    simulation-argument-proper, Bohmian trajectory visualization), so the
    checker can exclude them from falsifiability statistics rather than
    silently counting them as untested. -/
inductive Status where
  | open           -- falsifiable in principle, not yet resolved
  | falsified      -- ruled out by cited evidence
  | corroborated   -- currently consistent with cited evidence
  | unfalsifiable  -- not falsifiable even in principle; kept for completeness
  deriving Repr, DecidableEq, BEq

/-- A single testable (or explicitly non-testable) claim.

    `predictedSignature` and `datasetOrObservatory` are left empty for
    `unfalsifiable` claims, since there is no experiment to point to. -/
structure Claim where
  name                 : String
  postulate            : String
  predictedSignature   : String
  datasetOrObservatory : String
  status               : Status
  reference            : String
  deriving Repr, BEq

end Ledger
