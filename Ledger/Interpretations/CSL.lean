import Ledger.Core

namespace Ledger.Interpretations

/-- Continuous Spontaneous Localization model, parameterized by collapse
rate `lambda` and correlation length `rC`. Standard reference values in
the literature: original GRW/CSL ~ `lambda ≈ 1e-16 s⁻¹` at `rC ≈ 1e-7 m`;
Adler's proposed value ~ `lambda ≈ 4e-8±2 s⁻¹` at the same `rC` (Adler,
J. Phys. A 40, 2935 (2007)). This is the flagship first case for the
ledger — see docs/ARCHITECTURE.md. -/
structure CSL extends Interpretation where
  lambda : ℝ
  rC : ℝ

def csl (lambda rC : ℝ) : CSL where
  name := "CSL"
  hasCollapse := true
  isLocal := true
  isDeterministic := false
  lambda := lambda
  rC := rC

/-! ### Closed falsification: Adler's parameter value

Piscicchia, Bassi, Curceanu, Del Grande, Donadi, Hiesmayr & Pichler,
"CSL Collapse Model Mapped with the Spontaneous Radiation", arXiv:1710.01973
(2017) [also published in Entropy 19(7), 319]: CSL predicts spontaneous
X-ray photon emission from (quasi-)free charged particles, entirely
independent of any superposition experiment. Analyzing X-ray emission
data from the IGEX germanium detector (80 kg·day exposure), they derive
a 95%-CL upper bound on the mass-proportional CSL collapse rate at the
standard correlation length `rC = 1e-7 m` (their eq. 18):

    lambda ≤ 6.8e-12 s⁻¹   (mass-proportional model, rC = 1e-7 m)

Their conclusion, verbatim in scope: "the higher value on λ [Adler 2007]
can be excluded for a white noise scenario, in both mass proportional
and non-mass proportional models." Adler's central value (4e-8 s⁻¹) is
about four orders of magnitude above this bound; even the low end of his
stated ±2-order-of-magnitude uncertainty (4e-10 s⁻¹) is roughly 60× above
it. This is independently corroborated: Wolf et al., "STE-QUEST" mission
proposal, arXiv:2211.15412 (2022), sec. 2.3, states plainly that "Adler's
values have already been excluded experimentally," while explicitly
noting the much weaker original GRW value (`lambda = 1e-16 s⁻¹` at the
same `rC`) is "yet to be tested."

This falsification does NOT touch CSL as a model, nor the original GRW
parameter choice — both remain live (see `manifest.yaml`: `csl` and `grw`
are `pending`, only `csl-adler` is `falsified`). Conflating "a specific
parameter point is falsified" with "the model is falsified" would be
exactly the overclaiming this repo exists to avoid. -/

/-- Piscicchia et al. 2017's 95%-CL upper bound on the mass-proportional
CSL collapse rate at `rC = 1e-7 m`, from IGEX germanium X-ray emission
data (their eq. 18). This number is taken directly from that paper, not
independently re-derived here — the full derivation involves a Poisson/
gamma-distribution fit to the IGEX spectrum that is out of scope to
reproduce in Lean. -/
noncomputable def igexXrayBound_rC_1e7 : ℝ := 6.8e-12

/-- Adler's proposed CSL collapse rate at `rC = 1e-7 m` (Adler 2007;
central value of the stated `4e-8±2 s⁻¹`). -/
noncomputable def adlerLambda : ℝ := 4e-8

/-- If CSL holds with Adler's proposed parameter value, the actual
collapse rate at `rC = 1e-7 m` is `adlerLambda`. The IGEX X-ray
non-observation (no excess spontaneous emission beyond background)
implies the true rate is at most `igexXrayBound_rC_1e7`. These two
premises are jointly inconsistent: Adler's value is falsified. -/
theorem adler_csl_falsified_by_igex_xray_bound
    (hObserved : adlerLambda ≤ igexXrayBound_rC_1e7) : False :=
  Ledger.falsified_of_value_exceeds_bound adlerLambda igexXrayBound_rC_1e7
    (by norm_num [adlerLambda, igexXrayBound_rC_1e7])
    hObserved

/-!
### Open: the unconstrained model / GRW-parameter regime

`Ledger.falsified_of_rate_exceeds_bound` (the decoherence-rate
specialization, for interferometric-type experiments) remains the
reusable schema for testing the GRW-parameter regime, which is NOT
falsified by the above — closing a real instance there needs four
numbers pulled from one specific, cited superposition experiment:

- `lambda`, `rC` — candidate values (e.g. the original GRW pair)
- `d`, `amplification` — the superposition separation and amplification
  factor for the actual object used in that experiment
- `GammaMax` — the upper bound on decoherence rate implied by observed
  coherence (visibility retained, hold time) in that experiment

I have not hardcoded this instance. Interferometric bounds at
`rC = 1e-7 m` (e.g. ~5e-6 s⁻¹, per matter-wave interferometry cited in
Vinante et al., Phys. Rev. D, arXiv:1510.05791) sit many orders of
magnitude above the GRW value (1e-16 s⁻¹), so this regime is genuinely
open — asserting a numeric exclusion here would be fabricating a result
the literature does not support.
-/

-- theorem grw_regime_falsified_by_<experiment> : False :=
--   Ledger.falsified_of_rate_exceeds_bound
--     (lambda := ...) (rC := ...) (d := ...) (amplification := ...)
--     (GammaMax := ...)
--     (hModel := by norm_num [Ledger.effectiveRate, Ledger.singleParticleRate])
--     (hObserved := by norm_num [Ledger.effectiveRate, Ledger.singleParticleRate])

end Ledger.Interpretations
