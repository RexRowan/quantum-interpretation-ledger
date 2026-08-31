import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

/-- If spacetime is a lattice simulation, the lattice spacing imposes an
anisotropy and a cutoff on the highest-energy cosmic-ray spectrum,
breaking exact rotational symmetry at the lattice scale. See Beane,
Davoudi, Savage, "Constraints on the Universe as a Numerical Simulation",
Eur. Phys. J. A 50, 148 (2014): they derive that a finite lattice spacing
would show up as an anisotropic distortion/cutoff in the ultra-high-energy
cosmic-ray flux, correlated with the lattice's preferred directions. -/
def cosmicRayAnisotropy : Postulate where
  name := "Beane-Davoudi-Savage cosmic-ray lattice anisotropy"

-- Status: Pending (see manifest.yaml).
-- Pierre Auger Observatory UHE cosmic-ray flux data is the relevant
-- dataset, but no specific published bound has been formalized here as
-- a falsification instance. Beane-Davoudi-Savage's own paper treats this
-- as a plausibility argument about detectability in principle, not a
-- closed exclusion against a specific lattice-spacing value — closing a
-- real instance needs a specific predicted anisotropy magnitude for a
-- candidate lattice spacing, checked against a specific Auger analysis.
-- Do not add a falsification theorem here without that.

end Ledger.SimulationSignatures
