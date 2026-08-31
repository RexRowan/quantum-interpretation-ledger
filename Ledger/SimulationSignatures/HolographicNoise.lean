import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

/-- Spacetime has a minimum resolvable grain size, producing correlated
positional noise ("holographic noise") between co-located detectors that
probe the same spacetime volume, per Hogan's holographic-noise proposal.
The Fermilab Holometer (Chou, Glass, Gustafson, Hogan, Kamai, Kwon, Lanza,
McCuller, Meyer, Richardson, Stoughton, Tomlin, Weiss, "Interferometric
Constraints on Quantum Geometrical Shear Noise Correlations", Class.
Quantum Grav. 34, 165005 (2017), arXiv:1703.08503) ran the relevant
experiment and reported no detected correlated noise, ruling out the
originally proposed simplest holographic-noise model at their tested
sensitivity. -/
def holographicNoise : Postulate where
  name := "Hogan holographic spacetime graininess"

-- Status: Constrained, not Falsified (see manifest.yaml).
--
-- An earlier draft of this file marked this claim `falsified` outright.
-- That was an overclaim: I do not have a verified numeric value for the
-- specific noise-power bound Chou et al. report, and the repo's own norm
-- (see Ledger.Interpretations.CSL, Ledger.ARCHITECTURE.md) is that a
-- falsification theorem needs both the predicted value and the bound
-- traceable to a citation, not asserted from general recollection of the
-- paper's conclusion. Fabricating a number here to close the theorem
-- would be exactly the overclaiming this repo exists to avoid.
--
-- What's solid: the Holometer collaboration did run this exact
-- experiment and did report a null result for the model they tested.
-- That's real literature, hence `constrained` rather than `pending` —
-- but turning it into a genuine Lean falsification instance needs the
-- specific reported bound and the specific model-predicted noise power
-- it's compared against, pulled directly from arXiv:1703.08503 (or the
-- earlier arXiv:1512.01216 first-results paper), not fabricated here.

end Ledger.SimulationSignatures
