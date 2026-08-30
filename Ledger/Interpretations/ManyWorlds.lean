import Ledger.Core

namespace Ledger.Interpretations

-- Status: Pending (see manifest.yaml).
-- No known falsification criterion is currently formalizable: Many-Worlds
-- is empirically equivalent to bare unitary QM under present experimental
-- capability. Do not add a falsification theorem here without a genuine
-- distinguishing experimental result to cite.

def manyWorlds : Interpretation where
  name := "Many-Worlds (Everett)"
  hasCollapse := false
  isLocal := true
  isDeterministic := true

end Ledger.Interpretations
