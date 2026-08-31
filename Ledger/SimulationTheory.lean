/-
  Ledger.SimulationTheory

  New axiom-set family: claims that a proposed "simulation signature" would
  be observable in physical data if spacetime/physics were computational
  rather than continuous. Grouped, like ObjectiveCollapse, by what kind of
  evidence would falsify the claim — not by which paper or popularizer it
  came from.

  Buckets covered here (see docs/simulation-theory.md for the full writeup):
    1. Discretization/lattice signatures — falsifiable, real data exists
    2. Computational-constraint signatures — weakly falsifiable, indirect
    3. Statistical/philosophical arguments — not falsifiable, kept for
       completeness only (mirrors ObjectiveCollapse's
       notExperimentallyDistinguishable list)

  Bucket 4 (anomaly-hunting claims, e.g. contested CMB "glitches") is left
  for a follow-up pass — most entries there are already-contested rather
  than freshly falsifiable, so they need individual sourcing before they
  belong in a checked list rather than a narrative one.
-/

import Ledger.Claim

namespace Ledger.SimulationTheory

open Ledger

/-- Bucket 1: discretization/lattice signatures. If spacetime is a lattice
    simulation, the lattice spacing should leave a distinguishable
    fingerprint in high-energy physics — these are the claims with an
    actual dataset to check against. -/
def latticeSignatures : List Claim := [
  { name := "Beane-Davoudi-Savage cosmic-ray anisotropy"
    postulate := "A finite spacetime lattice spacing imposes an anisotropy \
                  and a cutoff on the highest-energy cosmic-ray spectrum, \
                  breaking exact rotational symmetry at the lattice scale"
    predictedSignature := "Anisotropic distortion / cutoff in the UHE cosmic-ray \
                            energy spectrum correlated with lattice orientation"
    datasetOrObservatory := "Pierre Auger Observatory UHE cosmic-ray flux data"
    status := Status.open
    reference := "Beane, Davoudi, Savage, Eur. Phys. J. A 50, 148 (2014)" },

  { name := "Lorentz-invariance violation at high energy"
    postulate := "A discretized spacetime should produce energy-dependent \
                  photon propagation speed at scales approaching the \
                  discretization/Planck scale"
    predictedSignature := "Energy-dependent arrival-time dispersion in \
                            high-energy photons from distant sources"
    datasetOrObservatory := "Fermi-LAT gamma-ray burst timing data"
    status := Status.open
    reference := "Fermi-LAT GRB Lorentz-invariance-violation constraint program" },

  { name := "Holometer-style spacetime graininess"
    postulate := "Spacetime has a minimum resolvable grain size, producing \
                  correlated positional noise ('holographic noise') between \
                  separated detectors at that scale"
    predictedSignature := "Cross-correlated high-frequency positional noise \
                            between co-located interferometers, above the \
                            noise floor expected from continuous spacetime"
    datasetOrObservatory := "Fermilab Holometer interferometer data"
    status := Status.falsified
    reference := "Chou et al., Fermilab Holometer collaboration — no \
                  holographic noise detected at the sensitivity probed; \
                  rules out the tested class of graininess models" }
]

/-- Bucket 2: computational-constraint signatures. Weaker and more indirect
    than lattice claims — these test whether physical systems obey bounds
    that a finite computational substrate would need to impose, rather than
    looking for a discretization artifact directly. -/
def computationalConstraints : List Claim := [
  { name := "Bekenstein-bound finite information density"
    postulate := "Physical systems obey a strict finite bound on information \
                  density (bits per unit area/energy), consistent with a \
                  finite computational substrate rather than continuous \
                  physical fields"
    predictedSignature := "No system observed to exceed the Bekenstein bound \
                            for its energy and radius, including in extreme \
                            (near-black-hole-density) regimes"
    datasetOrObservatory := "Black-hole thermodynamics / entropy-bound literature; \
                              no dedicated observatory, tested via consistency checks"
    status := Status.corroborated
    reference := "Bekenstein, Phys. Rev. D 23, 287 (1981); bound holds in all \
                  tested regimes so far but this is also just standard \
                  thermodynamics, not sim-specific evidence — a genuinely \
                  weak discriminator" },

  { name := "Rendering-resolution / observation-dependent detail limit"
    postulate := "Physical detail below some resolution only 'resolves' when \
                  measured, analogous to level-of-detail rendering in a \
                  simulated environment, beyond what decoherence alone predicts"
    predictedSignature := "A measurement-triggered resolution limit distinct \
                            from ordinary quantum measurement/decoherence effects"
    datasetOrObservatory := "None — no proposed experiment cleanly separates \
                              this from standard quantum measurement theory"
    status := Status.open
    reference := "Informal 'rendering artifact' proposals (Campbell et al. and \
                  similar popular-science framings); no rigorous formalization \
                  found — flagged as the weakest entry in this bucket" }
]

/-- Bucket 3: statistical/philosophical arguments. Not falsifiable even in
    principle — kept for completeness, mirroring
    ObjectiveCollapse.notExperimentallyDistinguishable. -/
def nonFalsifiable : List Claim := [
  { name := "Bostrom simulation-argument-proper"
    postulate := "At least one of: civilizations never reach \
                  simulation-capable maturity, or such civilizations don't \
                  run ancestor simulations, or we are almost certainly in one"
    predictedSignature := ""
    datasetOrObservatory := ""
    status := Status.unfalsifiable
    reference := "Bostrom, Philosophical Quarterly 53 (2003) — a probabilistic \
                  argument about civilizations, not a physical claim; no \
                  experiment bears on it" },

  { name := "Fine-tuning-as-simulation-evidence"
    postulate := "The fine-tuning of physical constants is evidence the \
                  universe is a designed/simulated construct"
    predictedSignature := ""
    datasetOrObservatory := ""
    status := Status.unfalsifiable
    reference := "Standard fine-tuning literature, repurposed as sim-evidence; \
                  philosophical framing, not an empirical claim" }
]

/-- All simulation-theory-family claims combined, for family-level summaries. -/
def all : List Claim := latticeSignatures ++ computationalConstraints ++ nonFalsifiable

end Ledger.SimulationTheory
