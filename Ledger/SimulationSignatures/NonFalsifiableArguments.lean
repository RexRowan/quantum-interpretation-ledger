import Ledger.SimulationSignatures.Core

namespace Ledger.SimulationSignatures

-- Status: Out of scope (see manifest.yaml).
-- Grouped together, like Ledger.Interpretations.Bohmian, because neither
-- claim is falsifiable even in principle by this method — tracked for
-- completeness, not as a candidate for a falsification theorem.

/-- Bostrom's simulation-argument-proper: at least one of — civilizations
never reach simulation-capable maturity, such civilizations don't run
ancestor simulations, or we are almost certainly in one. Bostrom,
Philosophical Quarterly 53 (2003). A probabilistic argument about
civilizations, not a physical claim; no experiment bears on it. -/
def bostromTrilemma : Postulate where
  name := "Bostrom simulation-argument-proper"

/-- The fine-tuning of physical constants as evidence the universe is a
designed/simulated construct — repurposes the standard fine-tuning
literature; a philosophical framing, not an empirical claim. -/
def fineTuningAsEvidence : Postulate where
  name := "Fine-tuning-as-simulation-evidence"

end Ledger.SimulationSignatures
