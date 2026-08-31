import Ledger.Core

namespace Ledger.Interpretations

-- Status: Constrained (see manifest.yaml).
-- The literature (Bong et al.) reports an experimental violation of
-- local-friendliness inequalities, which constrains any interpretation
-- committed to both locality and observer-independent ("absolute") facts.
-- This has not yet been encoded as a Lean falsification theorem — doing
-- so requires formalizing the local-friendliness assumptions precisely
-- enough to state as an `Interpretation`, which is nontrivial and should
-- not be rushed just to move this row to Falsified.

def localFriendlinessAssumptions : Interpretation where
  name := "Extended Wigner's Friend / Local Friendliness"
  hasCollapse := true
  isLocal := true
  isDeterministic := false

end Ledger.Interpretations
