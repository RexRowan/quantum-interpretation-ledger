import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

/-- A discretized spacetime should produce energy-dependent photon
propagation speed as photon energy approaches the discretization/Planck
scale, since a lattice breaks exact Lorentz invariance. Fermi-LAT's
gamma-ray-burst timing program is the ongoing test of this class of
prediction (energy-dependent arrival-time dispersion from distant
sources). -/
def lorentzInvarianceViolation : Postulate where
  name := "Discretization-induced Lorentz invariance violation"

-- Status: Pending (see manifest.yaml).
-- Fermi-LAT's GRB dispersion-limit program has published increasingly
-- tight bounds on quantum-gravity energy scales over the years, but
-- these bound the discretization scale rather than excluding
-- discretization outright, and no specific bound has been formalized
-- here against a specific lattice-discretization model's prediction.
-- Closing a real instance needs a specific model-predicted dispersion
-- for a candidate lattice spacing, checked against one specific,
-- cited Fermi-LAT analysis.

end Ledger.SimulationSignatures
