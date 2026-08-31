/-
  Ledger.Checker

  Generic falsification-checking functions. These operate over any
  `List Ledger.Claim` and never reference a specific axiom-set family,
  so the same functions serve ObjectiveCollapse.lean, SimulationTheory.lean,
  and any family added later.
-/

import Ledger.Claim

namespace Ledger

/-- Claims that are falsifiable even in principle (excludes `unfalsifiable`). -/
def falsifiable (claims : List Claim) : List Claim :=
  claims.filter (fun c => c.status != Status.unfalsifiable)

/-- Claims already ruled out by cited evidence. -/
def falsified (claims : List Claim) : List Claim :=
  claims.filter (fun c => c.status == Status.falsified)

/-- Claims still open — falsifiable in principle, unresolved so far. -/
def open_ (claims : List Claim) : List Claim :=
  claims.filter (fun c => c.status == Status.open)

/-- Claims currently consistent with cited evidence. -/
def corroborated (claims : List Claim) : List Claim :=
  claims.filter (fun c => c.status == Status.corroborated)

/-- Claims flagged as not falsifiable even in principle. -/
def unfalsifiable (claims : List Claim) : List Claim :=
  claims.filter (fun c => c.status == Status.unfalsifiable)

/-- Fraction of the falsifiable subset that has actually been falsified.
    Returns `none` when there are no falsifiable claims to divide by. -/
def falsificationRate (claims : List Claim) : Option Float :=
  let fset := falsifiable claims
  if fset.isEmpty then
    none
  else
    some ((falsified claims).length.toFloat / fset.length.toFloat)

/-- A short summary line per claim, for CLI or CI output. -/
def summarize (c : Claim) : String :=
  s!"[{repr c.status}] {c.name} — {c.postulate} ({c.reference})"

/-- Summary of an entire axiom-set family, in the same shape as the
    per-family docs/*.md tables. -/
def summarizeFamily (familyName : String) (claims : List Claim) : String :=
  let lines := claims.map summarize
  s!"== {familyName} ==\n" ++ String.intercalate "\n" lines

end Ledger
