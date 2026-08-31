# Simulation-theory signatures

Mirrors `Ledger/SimulationTheory.lean` exactly. Claims are grouped by what
kind of physical evidence would falsify them, not by which paper or
popularizer proposed them — same organizing principle as
`objective-collapse.md`.

## Bucket 1 — Discretization/lattice signatures

Falsifiable, and real data already exists to check against. If spacetime is
a lattice simulation, the lattice spacing should leave a fingerprint.

| Claim | Postulate | Dataset / observatory | Status | Reference |
|---|---|---|---|---|
| Beane-Davoudi-Savage cosmic-ray anisotropy | A finite lattice spacing imposes an anisotropy/cutoff on the highest-energy cosmic-ray spectrum | Pierre Auger Observatory UHE cosmic-ray flux | open | Beane, Davoudi, Savage, Eur. Phys. J. A 50, 148 (2014) |
| Lorentz-invariance violation at high energy | Discretization produces energy-dependent photon propagation speed near the discretization scale | Fermi-LAT gamma-ray burst timing | open | Fermi-LAT LIV constraint program |
| Holometer-style spacetime graininess | Spacetime has a minimum grain size producing correlated positional noise between separated detectors | Fermilab Holometer | **falsified** | Chou et al., Fermilab Holometer collaboration |

## Bucket 2 — Computational-constraint signatures

Weaker and more indirect than lattice claims: these test whether physical
systems obey bounds a finite computational substrate would need to impose,
rather than looking for a discretization artifact directly.

| Claim | Postulate | Dataset / observatory | Status | Reference |
|---|---|---|---|---|
| Bekenstein-bound finite information density | Physical systems obey a strict finite information-density bound | Black-hole thermodynamics / entropy-bound literature | corroborated (weak discriminator — also just standard thermodynamics) | Bekenstein, Phys. Rev. D 23, 287 (1981) |
| Rendering-resolution / observation-dependent detail limit | Detail below some resolution only resolves when measured, beyond ordinary decoherence | None — no experiment cleanly separates this from standard quantum measurement | open (weakest entry in this bucket) | Informal popular-science framings; no rigorous formalization found |

## Bucket 3 — Statistical/philosophical arguments (not falsifiable, completeness only)

- **Bostrom simulation-argument-proper** — a probabilistic trilemma about
  civilizations, not a physical claim. No experiment bears on it.
- **Fine-tuning-as-simulation-evidence** — repurposes the standard
  fine-tuning literature as design/simulation evidence; philosophical
  framing, not empirical.

## Bucket 4 — Anomaly-hunting claims (not yet in the checked list)

Claimed CMB "glitches" and other quantization anomalies belong here in
principle — falsifiable, but mostly already contested or falsified, and each
one needs individual sourcing before it's trustworthy enough to sit in a
checked `List Claim` rather than a narrative aside. Left as a follow-up.
