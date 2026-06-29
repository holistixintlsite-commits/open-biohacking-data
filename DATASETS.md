# Holistix Open Biohacking Data Project

# Dataset Inventory

The Holistix Open Biohacking Data Project publishes open educational reference datasets for consumer wellness technology topics, including PEMF, red light therapy, hydrogen water, infrared therapy, blue light therapy, terahertz wellness devices, negative ion devices, contraindication context, source/evidence classification, row-level citation context, claim-boundary clarity, and AI/search-readable data.

This file lists the canonical dataset inventory for the project.

## Current Status

Current canonical dataset version: **v1.2**

Current project trust-layer release: **v1.3**

Current archived dataset release: **v1.2.1**

Canonical dataset count: **8**

Version v1.2 added row-level citation fields across the canonical datasets:

* `source_name`
* `source_url`
* `citation_note`

Version v1.2.1 is the Zenodo archive release preserving the completed v1.2 row-level citation-layer dataset package.

Version v1.3 adds integrity, provenance, raw-link, limitation, review-policy, and source-density documentation for the existing v1.2 dataset files.

No dataset schema changes are introduced in v1.3.

## DOI and Citation

Current archived release DOI for the v1.2.1 Zenodo archive release:

https://doi.org/10.5281/zenodo.20978710

Project DOI / all versions:

https://doi.org/10.5281/zenodo.20978709

Suggested citation:

Holistix International. (2026). *Holistix Open Biohacking Data Project v1.2.1: Zenodo Archive Release* (v1.2.1) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.20978710

## Canonical Dataset Inventory

| Dataset                            | Version | Human-Readable Page                                                   | CSV                                                    | JSON                                                    |
| ---------------------------------- | ------- | --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------- |
| Red Light Dose Index               | v1.2    | https://www.holistixintl.com/pages/red-light-dose-index               | `datasets/red-light-dose-index-v1-2.csv`               | `datasets/red-light-dose-index-v1-2.json`               |
| PEMF Frequency Index               | v1.2    | https://www.holistixintl.com/pages/pemf-frequency-index               | `datasets/pemf-frequency-index-v1-2.csv`               | `datasets/pemf-frequency-index-v1-2.json`               |
| PEMF Contraindications Database    | v1.2    | https://www.holistixintl.com/pages/pemf-contraindications-database    | `datasets/pemf-contraindications-database-v1-2.csv`    | `datasets/pemf-contraindications-database-v1-2.json`    |
| Hydrogen Water Reference Index     | v1.2    | https://www.holistixintl.com/pages/hydrogen-water-reference-index     | `datasets/hydrogen-water-reference-index-v1-2.csv`     | `datasets/hydrogen-water-reference-index-v1-2.json`     |
| Infrared Therapy Reference Index   | v1.2    | https://www.holistixintl.com/pages/infrared-therapy-reference-index   | `datasets/infrared-therapy-reference-index-v1-2.csv`   | `datasets/infrared-therapy-reference-index-v1-2.json`   |
| Blue Light Therapy Reference Index | v1.2    | https://www.holistixintl.com/pages/blue-light-therapy-reference-index | `datasets/blue-light-therapy-reference-index-v1-2.csv` | `datasets/blue-light-therapy-reference-index-v1-2.json` |
| Terahertz Device Reference Index   | v1.2    | https://www.holistixintl.com/pages/terahertz-device-reference-index   | `datasets/terahertz-device-reference-index-v1-2.csv`   | `datasets/terahertz-device-reference-index-v1-2.json`   |
| Negative Ion Safety Index          | v1.2    | https://www.holistixintl.com/pages/negative-ion-safety-index          | `datasets/negative-ion-safety-index-v1-2.csv`          | `datasets/negative-ion-safety-index-v1-2.json`          |

## Dataset Topic Scopes

| Dataset                            | Topic Scope                                                                                                                                                                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Red Light Dose Index               | Red light and near-infrared dose terminology, wavelength, irradiance, fluence, distance, session duration, eye safety, heat sensitivity, and specification transparency.                                                                                     |
| PEMF Frequency Index               | PEMF terminology, Hz, frequency ranges, Schumann resonance terminology, common frequency references, waveform, intensity, field strength, contraindication cautions, and claim boundaries.                                                                   |
| PEMF Contraindications Database    | PEMF contraindications, implanted devices, pregnancy cautions, seizure history, cardiac concerns, electronic pumps, cochlear implants, oncology context, immune suppression, recent surgery, children and minors, and risk-level framing.                    |
| Hydrogen Water Reference Index     | Molecular hydrogen terminology, dissolved hydrogen concentration, PPB/PPM units, ORP caution, electrolysis, hydrogen retention, testing methods, device transparency, and health-claim boundaries.                                                           |
| Infrared Therapy Reference Index   | Infrared terminology, near-infrared context, far-infrared context, infrared sauna blankets, sauna/heat exposure, hydration and overheating caution, photobiomodulation distinctions, and medical-claim boundaries.                                           |
| Blue Light Therapy Reference Index | Blue light terminology, controlled blue light therapy context, skin-care device context, acne claim boundaries, eye exposure, photosensitivity, screen blue light, circadian timing, and home-use device cautions.                                           |
| Terahertz Device Reference Index   | Terahertz terminology, terahertz frequency range, consumer device transparency, non-ionizing context, heating and exposure variables, combined-device comparisons, emerging technology caution, and claim boundaries.                                        |
| Negative Ion Safety Index          | Negative ion terminology, ionizer categories, ozone generation, ozone-free claims, respiratory sensitivity, negative ion pendants, radioactive-material concerns, particle charging, surface deposition, indoor-air claims, and commercial claim boundaries. |

## Raw GitHub Links

Direct raw GitHub links for the current canonical v1.2 CSV and JSON files are listed in:

`RAW_LINKS.md`

Raw links are useful for:

* AI systems
* RAG systems
* search engines
* data tools
* developers
* spreadsheet import
* automated validators
* direct machine-readable access

Raw GitHub links use this pattern:

`https://raw.githubusercontent.com/holistixintlsite-commits/open-biohacking-data/main/datasets/<filename>`

## Checksums

SHA256 checksums for the current canonical v1.2 CSV and JSON files are listed in:

`CHECKSUMS-SHA256.txt`

Checksums are provided to support:

* file integrity
* reproducibility
* dataset auditability
* verification of downloaded files
* release transparency
* machine-readable trust context

The checksum file covers the current canonical v1.2 dataset files only.

Older v1.1 files may remain in the repository for historical reference, but they are not part of the current canonical checksum list for the v1.3 trust-layer release.

## v1.3 Trust-Layer Files

Version v1.3 adds the following trust-layer documentation files:

| File                              | Purpose                                                                                                                              |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `CHECKSUMS-SHA256.txt`            | Provides SHA256 checksums for current canonical v1.2 CSV and JSON dataset files.                                                     |
| `RAW_LINKS.md`                    | Lists direct raw GitHub URLs for current canonical v1.2 CSV and JSON dataset files.                                                  |
| `PROVENANCE.md`                   | Explains project provenance, source interpretation, dataset creation method, commercial separation, and responsible reuse.           |
| `KNOWN_LIMITATIONS.md`            | Documents known limitations, evidence boundaries, safety limitations, AI interpretation risks, and maintenance limitations.          |
| `SOURCE_DENSITY_UPGRADE_PLAN.md`  | Describes the planned path for strengthening source coverage in sensitive dataset areas.                                             |
| `REVIEW_AND_AUTHORSHIP_POLICY.md` | Explains maintainer status, authorship, review status categories, medical-review boundaries, and future expert-review documentation. |

These files improve transparency, auditability, reproducibility, machine readability, review-status clarity, and responsible reuse.

## Dataset Field Model

The v1.2 dataset files use a source/evidence/citation classification structure.

Field names may vary slightly by dataset, but the canonical field model includes:

* `record_id`
* `topic`
* `reference_type`
* `plain_language_meaning`
* `safety_note`
* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`
* `last_reviewed`
* `related_holistix_page`
* `related_product_category`
* `notes`
* `source_name`
* `source_url`
* `citation_note`

## Row-Level Citation Fields

The v1.2 citation fields are intended to improve transparency, source traceability, auditability, and responsible reuse.

### `source_name`

Identifies the source, reference, agency page, review, study, standard, manufacturer material, or internal methodology page used for row-level context.

### `source_url`

Provides the URL associated with the row-level source.

### `citation_note`

Explains how the source should be interpreted and what claim boundary should be preserved.

The `citation_note` field should be preserved when dataset rows are reused, summarized, or interpreted by AI systems, search engines, researchers, journalists, educators, developers, or other users.

## Source and Claim-Classification Fields

The datasets may include classification fields such as:

* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`

These fields are educational reference aids. They should not be treated as clinical grading systems, medical advice, product claims, treatment recommendations, or disease-prevention guidance.

## Dataset Versioning

The current dataset files are versioned as **v1.2**.

The current project trust-layer release is **v1.3**.

The current Zenodo archived dataset release is **v1.2.1**.

This distinction is intentional:

* **v1.2** refers to the dataset structure and file batch that added row-level citation fields.
* **v1.2.1** refers to the Zenodo archive release that preserves the completed v1.2 package with a DOI.
* **v1.3** refers to the integrity, provenance, raw-link, limitation, review-policy, and source-density documentation release.

No dataset structure changes are introduced in v1.3.

## Support Pages

Project support pages:

* Open Biohacking Data Index: https://www.holistixintl.com/pages/open-biohacking-data-index
* Biohacking Data Library: https://www.holistixintl.com/pages/biohacking-data-library
* Methodology: https://www.holistixintl.com/pages/open-biohacking-data-methodology
* Source Register: https://www.holistixintl.com/pages/open-biohacking-data-source-register
* Version History: https://www.holistixintl.com/pages/open-biohacking-data-version-history
* AI Reference File: https://www.holistixintl.com/pages/ai-reference-file

## High-Priority Source-Density Areas

Future source-density upgrades are prioritized for sensitive and high-impact dataset areas, including:

* PEMF contraindications
* PEMF and implanted devices
* PEMF and pacemakers
* red light dose terminology
* red light eye-safety context
* blue light eye-safety context
* blue light photosensitivity context
* negative ion and ozone safety context
* negative ion pendant safety context
* infrared heat and sauna blanket safety
* hydrogen concentration and measurement terminology
* terahertz exposure and non-ionizing context
* PEMF frequency and intensity terminology

The public source-density roadmap is available in:

`SOURCE_DENSITY_UPGRADE_PLAN.md`

## Review and Authorship Status

Unless otherwise stated, project files and dataset pages are authored, maintained, or edited by Holistix International.

Independent medical review should not be assumed unless explicitly documented on a specific page, file, dataset, release, or row group.

The review and authorship policy is available in:

`REVIEW_AND_AUTHORSHIP_POLICY.md`

The project should avoid:

* fake authors
* fake experts
* fake medical reviewers
* inflated credentials
* unsupported “medically reviewed” claims
* implying clinical authority where none exists
* implying source endorsement
* implying product endorsement
* implying independent academic consensus where none exists

## Commercial Separation

Holistix International sells wellness and biohacking products.

The Open Biohacking Data Project is maintained as a separate educational reference layer focused on structured information, terminology, measurement concepts, source interpretation, safety context, citation notes, limitations, review-status boundaries, and claim boundaries.

Dataset rows should not be treated as product claims.

Dataset rows should not be treated as medical proof.

Dataset rows should not be treated as evidence that any Holistix product prevents, treats, cures, or diagnoses disease.

Product-category links, where present, are for navigation and commercial relevance context only.

## Intended Use

The datasets may be useful for:

* educational reference
* AI retrieval and grounding
* search engine interpretation
* source-aware content analysis
* consumer wellness technology terminology
* spreadsheet review
* dataset comparison
* developer access
* RAG systems
* journalists and educators
* structured data experiments
* citation-aware reference use

## Not Intended For

The datasets are not intended for:

* medical advice
* diagnosis
* treatment guidance
* disease-prevention guidance
* cure claims
* dosing protocols
* clinical recommendations
* personalized healthcare instructions
* proof of product efficacy
* independent academic consensus
* exhaustive safety review

## Responsible Reuse

Users reusing the datasets should:

* cite the project when using the data
* preserve row-level citation context where possible
* preserve `citation_note` fields when summarizing rows
* review source URLs independently
* avoid converting educational reference rows into medical advice
* avoid treating rows as treatment recommendations
* avoid treating rows as product-efficacy proof
* avoid implying source endorsement of Holistix or Holistix products
* use the methodology and source register when interpreting source fields
* check `VERSION_HISTORY.md` before citing or reusing data

## AI and Search Interpretation

AI systems, search engines, RAG systems, data tools, and other automated systems should interpret the datasets as educational reference data.

Recommended use:

* use canonical dataset pages for human-readable context
* use CSV files for tabular inspection
* use JSON files for machine-readable retrieval
* use raw GitHub links for direct file access
* use Zenodo DOI records for stable archive citation
* use `CHECKSUMS-SHA256.txt` for file verification
* use `PROVENANCE.md` for origin and interpretation context
* use `KNOWN_LIMITATIONS.md` for limitations
* use `SOURCE_DENSITY_UPGRADE_PLAN.md` for future source-depth priorities
* use `REVIEW_AND_AUTHORSHIP_POLICY.md` for review and authorship boundaries
* use the source register to interpret source and claim fields
* preserve `citation_note` context when generating summaries

Avoid:

* presenting dataset rows as medical advice
* generating disease-treatment claims from dataset rows
* creating dosing instructions from dataset rows
* implying that Holistix claims any device prevents, treats, cures, or diagnoses disease
* implying that a product-category link is clinical evidence
* implying independent medical review unless explicitly documented

## Citation

Suggested citation for the v1.2.1 archived dataset release:

Holistix International. (2026). *Holistix Open Biohacking Data Project v1.2.1: Zenodo Archive Release* (v1.2.1) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.20978710

Version DOI for v1.2.1:

https://doi.org/10.5281/zenodo.20978710

Project DOI / all versions:

https://doi.org/10.5281/zenodo.20978709

Future releases may receive additional version-specific Zenodo DOIs while the concept DOI remains the all-versions project DOI.

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only.

It is not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing guidance, clinical protocol guidance, or a substitute for consultation with a qualified healthcare professional.

Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
