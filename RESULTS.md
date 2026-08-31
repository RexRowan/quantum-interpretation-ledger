# Results

Status of each interpretation axiom-set tracked by the ledger. An interpretation
moves to **Falsified** only when a Lean theorem in `Ledger/Interpretations/`
derives `False` from its axioms plus an asserted experimental-result
hypothesis. Nothing is marked falsified on the basis of informal argument
alone.

This table is generated from `manifest.yaml` by `scripts/gen_results.py` —
edit the manifest, not this file directly.

## Status legend

| Symbol | Meaning |
|---|---|
| ✅ Falsified | A Lean theorem derives a contradiction from this axiom-set + a cited experimental hypothesis |
| ⏳ Pending | No Lean formalization exists yet; falsifiable in principle |
| ⚠️ Constrained | A relevant experimental result exists in the literature but is not yet encoded as a Lean falsification |
| 🚫 Out of scope | Empirically equivalent to standard QM under current knowledge — not falsifiable by this method; tracked for completeness |

## Current results

<!-- BEGIN TABLE -->
| Interpretation | Class | Status | Basis / theorem |
|---|---|---|---|
| Many-Worlds (Everett) | no-collapse | ⏳ Pending | No known falsification criterion — empirically equivalent to bare unitary QM |
| GRW (original parameters) | objective-collapse | ⏳ Pending | lambda=1e-16 s^-1 at rC=1e-7m not yet excluded (Wolf et al., STE-QUEST, arXiv:2211.15412, 2022) |
| CSL (GRW-parameter regime) | objective-collapse | ⏳ Pending | Weak (GRW-scale) parameter regime not yet excluded; interferometric bounds ~5e-6 s^-1 at rC=1e-7m are many orders above it |
| CSL (Adler parameters) | objective-collapse | ✅ Falsified | adler_csl_falsified_by_igex_xray_bound |
| Diósi–Penrose | objective-collapse-gravity | ⏳ Pending | Falsifiable via collapse-time vs. superposition mass/size experiments |
| Extended Wigner's Friend / Local Friendliness | observer-dependent-facts | ⚠️ Constrained | Literature reports violation of local-friendliness inequalities (Bong et al.); not yet a Lean theorem |
| Bohmian mechanics | hidden-variables | 🚫 Out of scope | Empirically equivalent to standard QM; visualization only, not falsifiable by this method |
| Beane-Davoudi-Savage cosmic-ray lattice anisotropy | lattice-discretization | ⏳ Pending | Falsifiable via UHE cosmic-ray anisotropy/cutoff (Pierre Auger data); no specific bound formalized against a candidate lattice spacing yet (Beane, Davoudi, Savage, Eur. Phys. J. A 50, 148, 2014) |
| Discretization-induced Lorentz invariance violation | lattice-discretization | ⏳ Pending | Falsifiable via energy-dependent photon arrival-time dispersion (Fermi-LAT GRB timing); no specific bound formalized against a candidate discretization model yet |
| Hogan holographic spacetime graininess | lattice-discretization | ⚠️ Constrained | Fermilab Holometer (Chou et al. 2017, arXiv:1703.08503) reports a null result for the originally proposed model; not yet encoded as a Lean falsification — closing it needs the specific reported bound, not a recalled summary |
| Rational Quantum Mechanics (Palmer) | lattice-discretization | ⏳ Pending | Discretizes Hilbert Space to rational squared-amplitudes/phases (basis parameter L), giving finite qubit information capacity N_max ~ 200-1000 (estimated via Diosi-Penrose gravitational collapse energy) above which algorithms needing maximal N-qubit entanglement (e.g. Shor's) lose quantum advantage; falsifiable in principle via factoring of a sufficiently large RSA integer (e.g. 2048-bit) using genuinely maximally-entangled qubit counts exceeding N_max, but N_max estimate is order-of-magnitude only and 'maximal Hilbert-space spread' is not independently operationalized, so a null result (no successful factoring) is not yet a clean confirmation vs. ordinary noise/engineering limits (Palmer, arXiv:2510.02877, 2026) |
| Bekenstein-bound finite information density | computational-constraint | ⚠️ Constrained | Bound holds in all tested regimes (Bekenstein, Phys. Rev. D 23, 287, 1981) but is a weak discriminator for simulation theory specifically — also just standard thermodynamics, doesn't distinguish simulated from non-simulated substrates |
| Observation-dependent rendering-resolution limit | computational-constraint | ⏳ Pending | Weakest entry in this family: no proposed experiment cleanly separates this from standard quantum measurement/decoherence theory; no rigorous formalization found |
| Bostrom trilemma / fine-tuning-as-evidence | philosophical-argument | 🚫 Out of scope | Probabilistic/philosophical arguments, not physical claims; no experiment bears on either (Bostrom, Philosophical Quarterly 53, 2003; standard fine-tuning literature repurposed as sim-evidence) |
<!-- END TABLE -->
