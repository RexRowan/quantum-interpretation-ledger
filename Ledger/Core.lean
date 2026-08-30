import Mathlib

namespace Ledger

/-- An interpretation of quantum mechanics, encoded as its distinguishing
axioms. Parameterized models (CSL, GRW, ...) extend this with their own
fields — see `Ledger.Interpretations.CSL` for the pattern. -/
structure Interpretation where
  name : String
  hasCollapse : Bool
  isLocal : Bool
  isDeterministic : Bool
  deriving Repr

/-- The falsification pattern used throughout this repo: an interpretation
is falsified relative to an asserted experimental hypothesis `P` if the
combination of its axioms and `P` derives `False`.

`P` is never derived by this repo — it's an asserted premise sourced from
a specific entry in the survey database. Lean can't measure anything;
formalizing that an experiment happened is a modeling choice, not a proof. -/
def Falsified (_I : Interpretation) (P : Prop) : Prop := P → False

/-! ### Collapse-rate machinery shared by GRW and CSL

Both models predict a decoherence rate for a spatial superposition that
rises from 0 (small separations) to a saturating value (large
separations), governed by two parameters: a characteristic rate `lambda`
and a correlation length `rC`. GRW derives this from discrete localization
jumps; CSL derives the same asymptotic form from continuous localization
noise. See Bassi, Lochan, Satin, Singh & Ulbricht, "Models of
wave-function collapse, underlying theories, and experimental tests",
Rev. Mod. Phys. 85, 471 (2013), sec. II–III, for the derivation in both
cases. -/

/-- Single-constituent-particle localization rate at separation `d`, for
a model with characteristic rate `lambda` and correlation length `rC`. -/
noncomputable def singleParticleRate (lambda rC d : ℝ) : ℝ :=
  lambda * (1 - Real.exp (-(d ^ 2) / (4 * rC ^ 2)))

/-- Effective rate for a composite object, scaled by an `amplification`
factor. The correct amplification factor for a rigid body of `N`
constituents depends on the relationship between `d`, `rC`, and the
object's internal structure (RMP 2013, sec. III) — it is **not** simply
`N` or `N^2` in general. Do not assume a value here; source it per
experiment. -/
noncomputable def effectiveRate (lambda rC d amplification : ℝ) : ℝ :=
  amplification * singleParticleRate lambda rC d

/-- The fully generic falsification pattern, independent of which
physical channel produced the bound (interferometric decoherence,
spontaneous photon emission, heating, etc.): if a model's predicted
value for some observable provably exceeds the experimentally
established upper bound, and the observation asserts the true value is
within that bound, the instantiation that produced `predicted` is
falsified.

Both `predicted` and `bound` must be traceable to a citation — `predicted`
to the model's defining equation plus the candidate parameter values,
`bound` to the specific experimental analysis that derived it. Neither
is invented by this repo. -/
theorem falsified_of_value_exceeds_bound
    (predicted bound : ℝ) (hModel : predicted > bound) (hObserved : predicted ≤ bound) :
    False :=
  absurd hObserved (not_le.mpr hModel)

/-- Specialization of `falsified_of_value_exceeds_bound` to the
decoherence-rate channel (interferometric-type experiments): if a
model's predicted effective decoherence rate for a specific `(lambda,
rC, d, amplification)` instantiation provably exceeds the experimentally
implied upper bound `GammaMax` on the actual decoherence rate, that
instantiation is falsified.

`hModel` is the numeric fact you establish by plugging in a candidate
parameter pair (e.g. `norm_num`/`nlinarith` once the numbers are fixed).
`hObserved` is the asserted experimental hypothesis: coherence was
observed to persist, so the actual rate is at most `GammaMax`. Both
premises must cite the specific survey entry they come from.

Not every falsification channel goes through this specialization — e.g.
spontaneous-photon-emission bounds (X-ray, no superposition involved)
compare a different predicted quantity and should use
`falsified_of_value_exceeds_bound` directly; see
`Ledger.Interpretations.CSL` for a worked example of each. -/
theorem falsified_of_rate_exceeds_bound
    (lambda rC d amplification GammaMax : ℝ)
    (hModel : effectiveRate lambda rC d amplification > GammaMax)
    (hObserved : effectiveRate lambda rC d amplification ≤ GammaMax) :
    False :=
  falsified_of_value_exceeds_bound _ _ hModel hObserved

end Ledger
