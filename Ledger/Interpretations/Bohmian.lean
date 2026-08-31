import Ledger.Core

namespace Ledger.Interpretations

-- Status: Out of scope (see manifest.yaml).
-- Bohmian mechanics reproduces standard QM's predictions exactly (given
-- the same initial ensemble distribution). No experiment falsifies it
-- relative to standard QM by construction. Tracked here for completeness,
-- not as a candidate for a falsification theorem.

def bohmian : Interpretation where
  name := "Bohmian mechanics"
  hasCollapse := false
  isLocal := false
  isDeterministic := true

end Ledger.Interpretations
