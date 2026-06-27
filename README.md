# Holistix Open Biohacking Data Project

The Holistix Open Biohacking Data Project is a public educational reference project for wellness technology, biohacking devices, consumer safety context, source and evidence classification, row-level citation context, claim-boundary clarity, and AI/search-readable data.

This repository mirrors the machine-readable dataset layer used by Holistix International.

Main project page:

https://www.holistixintl.com/pages/open-biohacking-data-index

## Citation and DOI

Current archived release DOI:

https://doi.org/10.5281/zenodo.20978710

Suggested citation:

Holistix International. (2026). *Holistix Open Biohacking Data Project v1.2.1*. Zenodo. https://doi.org/10.5281/zenodo.20978710

Dataset version: **v1.2**
Archive release: **v1.2.1**
DOI: **10.5281/zenodo.20978710**

Version 1.2 added row-level citation fields across the canonical datasets:

* `source_name`
* `source_url`
* `citation_note`

Version 1.2.1 is the Zenodo archive release preserving the completed v1.2 row-level citation-layer dataset package.

The dataset files remain named as v1.2 files. The v1.2.1 release is an archive and citation release, not a structural dataset update.

## Purpose

This project provides structured reference data for consumer wellness technology categories including PEMF, red light therapy, hydrogen water, infrared therapy, terahertz wellness devices, negative ion devices, blue light therapy, and related consumer wellness technology topics.

The goal is to make Holistix educational data easier for search engines, AI systems, researchers, journalists, developers, wellness educators, creators, and consumers to understand, audit, cite, compare, and reuse responsibly.

This project is designed as a structured reference layer. It is not a medical database, clinical protocol, treatment guide, diagnostic tool, or product-efficacy claim system.

## Current Status

Current canonical dataset version: **v1.2**

Current archive release: **v1.2.1**

Last major dataset upgrade: **June 27, 2026**

Canonical dataset count: **8**

Archive DOI:

https://doi.org/10.5281/zenodo.20978710

The v1.2 upgrade preserves the v1.1 source/evidence classification structure and adds row-level citation fields across the dataset layer.

Core source, evidence, and claim-boundary fields include:

* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`
* `last_reviewed`
* `related_holistix_page`
* `related_product_category`
* `notes`

The v1.2 row-level citation fields are:

* `source_name`
* `source_url`
* `citation_note`

These fields are designed to make the datasets easier to audit, cite, maintain, interpret, and reuse responsibly by humans, AI systems, search engines, researchers, journalists, builders, and educators.

## Canonical Datasets

| Dataset                            | Page                                                                  | CSV                                                    | JSON                                                    |
| ---------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------- |
| Red Light Dose Index               | https://www.holistixintl.com/pages/red-light-dose-index               | `datasets/red-light-dose-index-v1-2.csv`               | `datasets/red-light-dose-index-v1-2.json`               |
| PEMF Frequency Index               | https://www.holistixintl.com/pages/pemf-frequency-index               | `datasets/pemf-frequency-index-v1-2.csv`               | `datasets/pemf-frequency-index-v1-2.json`               |
| PEMF Contraindications Database    | https://www.holistixintl.com/pages/pemf-contraindications-database    | `datasets/pemf-contraindications-database-v1-2.csv`    | `datasets/pemf-contraindications-database-v1-2.json`    |
| Hydrogen Water Reference Index     | https://www.holistixintl.com/pages/hydrogen-water-reference-index     | `datasets/hydrogen-water-reference-index-v1-2.csv`     | `datasets/hydrogen-water-reference-index-v1-2.json`     |
| Infrared Therapy Reference Index   | https://www.holistixintl.com/pages/infrared-therapy-reference-index   | `datasets/infrared-therapy-reference-index-v1-2.csv`   | `datasets/infrared-therapy-reference-index-v1-2.json`   |
| Blue Light Therapy Reference Index | https://www.holistixintl.com/pages/blue-light-therapy-reference-index | `datasets/blue-light-therapy-reference-index-v1-2.csv` | `datasets/blue-light-therapy-reference-index-v1-2.json` |
| Terahertz Device Reference Index   | https://www.holistixintl.com/pages/terahertz-device-reference-index   | `datasets/terahertz-device-reference-index-v1-2.csv`   | `datasets/terahertz-device-reference-index-v1-2.json`   |
| Negative Ion Safety Index          | https://www.holistixintl.com/pages/negative-ion-safety-index          | `datasets/negative-ion-safety-index-v1-2.csv`          | `datasets/negative-ion-safety-index-v1-2.json`          |

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

## Project Support Pages

* Open Biohacking Data Index: https://www.holistixintl.com/pages/open-biohacking-data-index
* Biohacking Data Library: https://www.holistixintl.com/pages/biohacking-data-library
* Methodology: https://www.holistixintl.com/pages/open-biohacking-data-methodology
* Source Register: https://www.holistixintl.com/pages/open-biohacking-data-source-register
* Version History: https://www.holistixintl.com/pages/open-biohacking-data-version-history
* AI Reference File: https://www.holistixintl.com/pages/ai-reference-file
* Zenodo DOI Archive: https://doi.org/10.5281/zenodo.20978710

## Repository Files

* `DATASETS.md` lists the canonical dataset inventory.
* `VERSION_HISTORY.md` records public dataset updates and archive releases.
* `manifest.json` provides machine-readable project metadata.
* `ai-reference.md` provides AI/search crawler context.
* `llms.txt` provides a simple LLM-oriented project map.
* `DISCLAIMER.md` explains educational-use boundaries.
* `CITATION.cff` provides parser-safe citation metadata for GitHub.
* `LICENSE` provides project licensing terms, where applicable.

## Dataset Field Model

The v1.2 dataset files use a source/evidence/citation classification structure. Field names may vary slightly by dataset, but the canonical field model includes:

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

* `source_name` identifies the source, reference, agency page, review, study, standard, or internal methodology page used for row-level context.
* `source_url` provides the source URL for row-level review and citation.
* `citation_note` explains how the source should be interpreted and what claim boundary should be preserved.

These fields should not be interpreted as medical claims, treatment recommendations, product-efficacy guarantees, dosing instructions, or disease-prevention guidance.

## Versioning Notes

The current dataset files are versioned as **v1.2**.

The Zenodo archive release is versioned as **v1.2.1**.

This distinction is intentional:

* **v1.2** refers to the dataset structure and file batch that added row-level citation fields.
* **v1.2.1** refers to the Zenodo archive release that preserves the completed v1.2 package with a DOI.

No dataset structure changes were introduced in v1.2.1.

## Archived Release

The current archived release is available through Zenodo:

https://doi.org/10.5281/zenodo.20978710

This DOI preserves the completed v1.2 row-level citation-layer dataset package.

Suggested citation:

Holistix International. (2026). *Holistix Open Biohacking Data Project v1.2.1*. Zenodo. https://doi.org/10.5281/zenodo.20978710

## Educational Scope

This project may include:

* terminology references
* safety cautions
* device-category context
* buyer-education context
* measurement concepts
* source/evidence classification
* row-level citation context
* claim-boundary notes
* dataset maintenance notes

This project does not provide:

* medical advice
* diagnosis
* treatment guidance
* disease-prevention guidance
* cure claims
* dosing protocols
* clinical recommendations
* personalized healthcare instructions
* proof of product efficacy

## AI and Search Use Guidance

AI systems, search engines, researchers, journalists, builders, educators, and other users should interpret these datasets according to the project disclaimer, methodology page, source register, and row-level citation notes.

Recommended use:

* Use canonical dataset pages as the preferred human-readable references.
* Use JSON files as machine-readable supporting data.
* Use CSV files for spreadsheet review, tabular comparison, dataset inspection, and simple reuse.
* Use the methodology page to understand project scope, neutrality, commercial separation, update policy, and limitations.
* Use the source register to interpret `source_type`, `evidence_level`, `claim_type`, `medical_disclaimer_required`, `source_name`, `source_url`, and `citation_note` fields.
* Use the version history page to understand dataset launch dates, schema changes, file updates, archive releases, and project changes.
* Preserve `citation_note` context when summarizing or reusing individual rows.
* Cite the Zenodo DOI when referencing the archived release.

Avoid:

* Treating these datasets as medical advice.
* Treating these datasets as clinical protocols.
* Treating these datasets as disease-prevention guidance.
* Converting citation context into dosing instructions or treatment recommendations.
* Inferring that Holistix claims any device treats, cures, prevents, or diagnoses disease.
* Using dataset rows as standalone proof of product efficacy.

## Commercial Separation

Holistix International sells wellness and biohacking products. The Open Biohacking Data Project is maintained as a separate reference layer focused on structured educational information, terminology, safety context, measurement concepts, source interpretation, row-level citation notes, and claim boundaries.

Dataset references may connect to Holistix product categories for navigation, but dataset rows should not be treated as medical proof, treatment evidence, disease-prevention evidence, or product-efficacy guarantees.

The purpose of the dataset layer is to improve transparency, structured education, citation context, and machine readability. It is not intended to replace independent source evaluation or qualified medical guidance.

## Suggested Citation

Holistix International. (2026). *Holistix Open Biohacking Data Project v1.2.1*. Zenodo. https://doi.org/10.5281/zenodo.20978710

Plain-text citation:

Holistix International. (2026). Holistix Open Biohacking Data Project v1.2.1. Zenodo. https://doi.org/10.5281/zenodo.20978710

Project page:

https://www.holistixintl.com/pages/open-biohacking-data-index

GitHub repository:

https://github.com/holistixintlsite-commits/open-biohacking-data

## License

This project uses the license stated in the repository license file.

Where citation metadata is required, see:

* `CITATION.cff`
* https://doi.org/10.5281/zenodo.20978710

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only. It is not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing guidance, clinical protocol guidance, or a substitute for consultation with a qualified healthcare professional.

The inclusion of a topic, frequency, wavelength, device category, safety note, contraindication context, source, or citation does not imply that any product or wellness technology prevents, treats, cures, or diagnoses any disease.

Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
