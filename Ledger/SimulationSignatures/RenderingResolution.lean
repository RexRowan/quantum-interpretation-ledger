import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

/-- Physical detail below some resolution only "resolves" when measured,
analogous to level-of-detail rendering in a simulated environment, beyond
what ordinary decoherence already predicts. -/
def renderingResolution : Postulate where
  name := "Observation-dependent rendering-resolution limit"

-- Status: Pending (see manifest.yaml) — but flagged as the weakest entry
-- in this family. No dataset or observatory is cited because none was
-- found: no proposed experiment in the literature cleanly separates this
-- claim from standard quantum measurement/decoherence theory. Informal
-- "rendering artifact" framings exist in popular-science discussion, but
-- I could not find a rigorous formalization to cite. Do not promote this
-- to `constrained` without a specific citable proposal that draws a
-- concrete, checkable line between this and ordinary decoherence.

end Ledger.SimulationSignatures
