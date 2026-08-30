import Ledger.Core

namespace Ledger.Interpretations

/-- Ghirardi–Rimini–Weber spontaneous collapse model, parameterized by a
collapse rate `lambda` (per particle per unit time). -/
structure GRW extends Interpretation where
  lambda : Float

def grw (lambda : Float) : GRW where
  name := "GRW"
  hasCollapse := true
  isLocal := true
  isDeterministic := false
  lambda := lambda

-- Status: Pending (see manifest.yaml).
-- TODO: `grw_lambda_bound_falsified` — derive False from a candidate
-- lambda value combined with an asserted coherence-persistence-beyond-bound
-- hypothesis, citing the relevant survey entry.
-- theorem grw_lambda_bound_falsified (m : GRW) (h : CoherencePersisted m) :
--     False := sorry

end Ledger.Interpretations
