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
| GRW | objective-collapse | ⏳ Pending | Falsifiable via collapse-rate (lambda) bound vs. decoherence-persistence experiments |
| CSL | objective-collapse | ⏳ Pending | Falsifiable via lambda, rC bounds vs. optomechanics/matter-wave interferometry |
| Diósi–Penrose | objective-collapse-gravity | ⏳ Pending | Falsifiable via collapse-time vs. superposition mass/size experiments |
| Extended Wigner's Friend / Local Friendliness | observer-dependent-facts | ⚠️ Constrained | Literature reports violation of local-friendliness inequalities (Bong et al.); not yet a Lean theorem |
| Bohmian mechanics | hidden-variables | 🚫 Out of scope | Empirically equivalent to standard QM; visualization only, not falsifiable by this method |
<!-- END TABLE -->
