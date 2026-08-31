/-
  Ledger.ObjectiveCollapse

  Migrated in full from Experimental-Tests-of-Quantum-Interpretations,
  which has since been reduced to a standalone interactive demo. This is
  now the canonical copy — see docs/objective-collapse.md for the
  human-readable mirror of this same list.

  Objective collapse (GRW, CSL, Diósi-Penrose) is the one interpretation
  family that modifies the Schrödinger equation, which is what makes it
  falsifiable in the first place. Many-worlds, Bohmian mechanics, QBism,
  relational QM, and Copenhagen-without-collapse all predict identical
  statistics to unitary QM and so have no entry here — see the
  `notExperimentallyDistinguishable` list below for those, kept for
  completeness only.
-/

import Ledger.Claim

namespace Ledger.ObjectiveCollapse

open Ledger

/-- The falsifiable branch: claims that directly test GRW / CSL /
    Diósi-Penrose against unitary QM. -/
def claims : List Claim := [
  { name := "Dey-Barker-Datta Coulomb squeezing bound"
    postulate := "CSL collapse rate λ produces detectable decoherence via \
                  Coulomb-mediated squeezing between two levitated nanospheres"
    predictedSignature := "Bound on λ inconsistent with observed squeezing"
    datasetOrObservatory := "Levitated nanosphere pair, Coulomb-coupled"
    status := Status.open
    reference := "arXiv:2604.21705" },

  { name := "Reversible Nanoparticle Pointer"
    postulate := "CSL predicts irreversible interference-visibility loss \
                  that ordinary unitary QM does not produce"
    predictedSignature := "Ramsey-interferometric visibility loss that fails \
                            to reverse under time-reversal protocol"
    datasetOrObservatory := "Ramsey interferometry on levitated nanoparticle"
    status := Status.open
    reference := "arXiv:2606.22707" },

  { name := "Experimental Blueprint (Bayesian separation protocol)"
    postulate := "Collapse-induced decoherence is statistically separable \
                  from environmental noise given a suitable Bayesian protocol"
    predictedSignature := "Posterior favoring a nonzero collapse-decoherence \
                            term over noise-only models"
    datasetOrObservatory := "Proposed Bayesian analysis pipeline, no fixed apparatus yet"
    status := Status.open
    reference := "arXiv:2512.02838" },

  { name := "Diósi-Penrose vs. gravitationally induced entanglement"
    postulate := "Detecting gravitationally induced entanglement (GIE) between \
                  two masses falsifies Diósi-Penrose collapse dynamics"
    predictedSignature := "GIE detection under conditions DP predicts should suppress it"
    datasetOrObservatory := "Proposed GIE detection experiments (masses in superposition)"
    status := Status.open
    reference := "Phys. Rev. D 111, L121101 (2025) — live, unresolved dispute; not settled" }
]

/-- No-go theorems and consistency checks: these constrain interpretations
    but don't distinguish between them the way the claims above do. Kept
    `open` since they bear on future falsification work (e.g. tightening
    what counts as an "observer" for Local Friendliness tests) even though
    none is itself a collapse-vs-unitary discriminator. -/
def noGoConstraints : List Claim := [
  { name := "Zeng-Zhang neural-network friend"
    postulate := "A neural network can stand in for an 'observer' in \
                  Wigner's-friend-style tests, probing the observer-hood loophole"
    predictedSignature := "N/A — probes definitional loophole, not a discriminating prediction"
    datasetOrObservatory := "Simulated / proposed NN-as-friend setup"
    status := Status.open
    reference := "New J. Phys. 27, 104502 (2025)" },

  { name := "Bednorz et al. objectivity-loophole closure"
    postulate := "The objectivity loophole in Bell / Local-Friendliness tests \
                  can be closed on a public, cloud-accessible quantum computer"
    predictedSignature := "Local-Friendliness violation surviving the closed loophole"
    datasetOrObservatory := "Public quantum computer (directly in Qiskit territory)"
    status := Status.corroborated
    reference := "arXiv:2506.08940" },

  { name := "Walleghem-Catani Local-Friendliness / Kochen-Specker link"
    postulate := "Local Friendliness violation connects to Kochen-Specker \
                  generalized contextuality"
    predictedSignature := "N/A — theoretical connection, not itself an experiment"
    datasetOrObservatory := "N/A"
    status := Status.open
    reference := "arXiv:2502.02461" },

  { name := "Reassessing Wigner's Friend no-go strength"
    postulate := "Local Friendliness no-go theorems are not strictly stronger \
                  than Bell no-go theorems, contra common framing"
    predictedSignature := "N/A — counterpoint/critique, not a new experiment"
    datasetOrObservatory := "N/A"
    status := Status.open
    reference := "PMC12192408 (2025)" }
]

/-- Not experimentally distinguishable — included for completeness only.
    These are marked `unfalsifiable` so `Ledger.Checker` excludes them from
    any falsification-rate statistics by default. -/
def notExperimentallyDistinguishable : List Claim := [
  { name := "Bohmian trajectory visualization"
    postulate := "Bohmian mechanics reproduces standard QM statistics exactly"
    predictedSignature := ""
    datasetOrObservatory := ""
    status := Status.unfalsifiable
    reference := "Kocsis et al. 2011; Mahler et al. 2016; Foo et al. 2022 — \
                  weak-measurement trajectory reconstruction, a visualization \
                  of Bohmian mechanics, not a test against anything else" },

  { name := "QBism / relational QM / consistent histories"
    postulate := "These interpretations predict identical statistics to \
                  unitary QM under all circumstances"
    predictedSignature := ""
    datasetOrObservatory := ""
    status := Status.unfalsifiable
    reference := "No experimental section exists for the same reason as Bohmian mechanics" }
]

/-- All objective-collapse-family claims combined, for family-level summaries. -/
def all : List Claim := claims ++ noGoConstraints ++ notExperimentallyDistinguishable

end Ledger.ObjectiveCollapse
