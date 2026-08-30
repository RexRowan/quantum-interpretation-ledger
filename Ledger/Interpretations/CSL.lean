import Ledger.Core

namespace Ledger.Interpretations

/-- Continuous Spontaneous Localization model, parameterized by collapse
rate `lambda` and correlation length `rC`. This is the flagship first case
for the ledger — see docs/ARCHITECTURE.md. -/
structure CSL extends Interpretation where
  lambda : Float
  rC : Float

def csl (lambda rC : Float) : CSL where
  name := "CSL"
  hasCollapse := true
  isLocal := true
  isDeterministic := false
  lambda := lambda
  rC := rC

-- Status: Pending (see manifest.yaml).
-- TODO: `csl_lambda_bound_falsified` — derive False from a candidate
-- (lambda, rC) pair combined with an asserted experimental hypothesis
-- (e.g. coherence observed to persist beyond a given mass/timescale in
-- an optomechanics or matter-wave interferometry result). Cite the
-- specific survey entry the hypothesis comes from.
-- theorem csl_lambda_bound_falsified (m : CSL) (h : CoherencePersisted m) :
--     False := sorry

end Ledger.Interpretations
