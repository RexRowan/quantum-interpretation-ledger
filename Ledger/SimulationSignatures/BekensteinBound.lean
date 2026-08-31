import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

/-- Physical systems obey a strict finite bound on information density
(bits per unit area/energy), consistent with a finite computational
substrate rather than continuous physical fields. Bekenstein, Phys. Rev. D
23, 287 (1981). -/
def bekensteinBoundPostulate : Postulate where
  name := "Bekenstein-bound finite information density"

-- Status: Constrained, not Falsified or Pending (see manifest.yaml).
-- The bound holds in every tested regime, including near-black-hole
-- densities — but this is a genuinely weak discriminator for simulation
-- theory specifically: it's also just standard black-hole thermodynamics,
-- and every interpretation of QM (simulated substrate or not) that
-- respects the bound is consistent with the same evidence. No falsifying
-- observation is expected from this claim; it's tracked because it is
-- cited as sim-theory evidence in popular discussion, not because it is
-- a strong discriminator. Marking it a closed "corroborated" result (as
-- an earlier draft of this file did) overstated its evidential weight —
-- `constrained` more honestly reflects "real bound exists in the
-- literature, doesn't actually distinguish this family's claims."

end Ledger.SimulationSignatures
