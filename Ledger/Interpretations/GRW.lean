import Ledger.Core

namespace Ledger.Interpretations

/-- Ghirardi–Rimini–Weber spontaneous collapse model: discrete
localization "hits" at rate `lambda` per particle, each localizing to
width `rC`. Shares the same asymptotic rate form as CSL (see
`Ledger.singleParticleRate`) despite the different (discrete-jump vs.
continuous-noise) derivation — see Bassi et al., Rev. Mod. Phys. 85, 471
(2013), sec. II. Original proposed values: `lambda ≈ 1e-16 s⁻¹`,
`rC ≈ 1e-7 m` (Ghirardi, Rimini, Weber, Phys. Rev. D 34, 470 (1986)). -/
structure GRW extends Interpretation where
  lambda : ℝ
  rC : ℝ

def grw (lambda rC : ℝ) : GRW where
  name := "GRW"
  hasCollapse := true
  isLocal := true
  isDeterministic := false
  lambda := lambda
  rC := rC

-- Status: Pending (see manifest.yaml). Confirmed still open as of 2022:
-- Wolf et al., "STE-QUEST" mission proposal, arXiv:2211.15412, sec. 2.3,
-- states the original GRW value (`lambda = 1e-16 s⁻¹` at `rC = 1e-7 m`)
-- is "yet to be tested and [is] commonly regarded as [a target] to reach
-- for fully probing the model" — unlike Adler's proposed value, which
-- has been excluded (see Ledger.Interpretations.CSL).
--
-- Same schema and same caveat as `Ledger.Interpretations.CSL`:
-- `Ledger.falsified_of_rate_exceeds_bound` is reusable, but closing a real
-- instance needs `(lambda, rC, d, amplification, GammaMax)` sourced from one
-- specific, cited experiment, not asserted here.

-- theorem grw_original_value_falsified_by_<experiment> : False :=
--   Ledger.falsified_of_rate_exceeds_bound
--     (lambda := ...) (rC := ...) (d := ...) (amplification := ...)
--     (GammaMax := ...)
--     (hModel := by norm_num [Ledger.effectiveRate, Ledger.singleParticleRate])
--     (hObserved := by norm_num [Ledger.effectiveRate, Ledger.singleParticleRate])

end Ledger.Interpretations
