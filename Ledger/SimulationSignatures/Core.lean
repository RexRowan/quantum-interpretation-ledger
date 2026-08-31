import Ledger.Core

namespace Ledger.SimulationSignatures

/-- A postulate about physical reality being computational/simulated,
tracked the same way `Ledger.Interpretations` tracks QM interpretations:
axioms plus an asserted experimental hypothesis, falsified if they jointly
derive `False` (via `Ledger.falsified_of_value_exceeds_bound`, which is
already fully generic and needs no extension here).

Deliberately minimal: `Ledger.Interpretation`'s fields (`hasCollapse`,
`isLocal`, `isDeterministic`) classify interpretations of quantum
mechanics specifically and don't characterize claims about spacetime
discreteness or computational bounds, so this family gets its own
lightweight marker type instead of extending `Interpretation`. -/
structure Postulate where
  name : String
  deriving Repr

end Ledger.SimulationSignatures
