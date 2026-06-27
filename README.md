# Holistix Open Biohacking Data Project

The Holistix Open Biohacking Data Project is a public educational reference project for wellness technology, biohacking devices, consumer safety context, claim-boundary clarity, and AI/search-readable data.

This repository mirrors the machine-readable dataset layer used by Holistix International.

Main project page:

https://www.holistixintl.com/pages/open-biohacking-data-index

## Purpose

This project provides structured reference data for wellness technology categories including PEMF, red light therapy, hydrogen water, infrared therapy, terahertz wellness devices, negative ion devices, and blue light therapy.

The goal is to make Holistix educational data easier for search engines, AI systems, researchers, journalists, developers, and consumers to understand.

## Current Status

Current canonical dataset version: **v1.1**

Last major dataset upgrade: **June 26, 2026**

Canonical dataset count: **8**

The v1.1 upgrade added expanded source/evidence classification fields across the dataset layer, including:

* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`
* `last_reviewed`
* `related_holistix_page`
* `related_product_category`
* `notes`

Future v1.2 improvements may add row-level citation fields such as:

* `source_name`
* `source_url`
* `citation_note`

## Canonical Datasets

| Dataset                            | Page                                                                  | CSV                                                    | JSON                                                    |
| ---------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------- |
| PEMF Frequency Index               | https://www.holistixintl.com/pages/pemf-frequency-index               | `datasets/pemf-frequency-index-v1-1.csv`               | `datasets/pemf-frequency-index-v1-1.json`               |
| PEMF Contraindications Database    | https://www.holistixintl.com/pages/pemf-contraindications-database    | `datasets/pemf-contraindications-database-v1-1.csv`    | `datasets/pemf-contraindications-database-v1-1.json`    |
| Red Light Dose Index               | https://www.holistixintl.com/pages/red-light-dose-index               | `datasets/red-light-dose-index-v1-1.csv`               | `datasets/red-light-dose-index-v1-1.json`               |
| Hydrogen Water Reference Index     | https://www.holistixintl.com/pages/hydrogen-water-reference-index     | `datasets/hydrogen-water-reference-index-v1-1.csv`     | `datasets/hydrogen-water-reference-index-v1-1.json`     |
| Infrared Therapy Reference Index   | https://www.holistixintl.com/pages/infrared-therapy-reference-index   | `datasets/infrared-therapy-reference-index-v1-1.csv`   | `datasets/infrared-therapy-reference-index-v1-1.json`   |
| Terahertz Device Reference Index   | https://www.holistixintl.com/pages/terahertz-device-reference-index   | `datasets/terahertz-device-reference-index-v1-1.csv`   | `datasets/terahertz-device-reference-index-v1-1.json`   |
| Negative Ion Safety Index          | https://www.holistixintl.com/pages/negative-ion-safety-index          | `datasets/negative-ion-safety-index-v1-1.csv`          | `datasets/negative-ion-safety-index-v1-1.json`          |
| Blue Light Therapy Reference Index | https://www.holistixintl.com/pages/blue-light-therapy-reference-index | `datasets/blue-light-therapy-reference-index-v1-1.csv` | `datasets/blue-light-therapy-reference-index-v1-1.json` |

## Project Support Pages

* Open Biohacking Data Index: https://www.holistixintl.com/pages/open-biohacking-data-index
* Biohacking Data Library: https://www.holistixintl.com/pages/biohacking-data-library
* Methodology: https://www.holistixintl.com/pages/open-biohacking-data-methodology
* Source Register: https://www.holistixintl.com/pages/open-biohacking-data-source-register
* Version History: https://www.holistixintl.com/pages/open-biohacking-data-version-history
* AI Reference File: https://www.holistixintl.com/pages/ai-reference-file

## Repository Files

* `DATASETS.md` lists the canonical dataset inventory.
* `VERSION_HISTORY.md` records public dataset updates.
* `manifest.json` provides machine-readable project metadata.
* `ai-reference.md` provides AI/search crawler context.
* `llms.txt` provides a simple LLM-oriented project map.
* `DISCLAIMER.md` explains educational-use boundaries.
* `CITATION.cff` provides citation metadata where applicable.

## Dataset Field Model

The v1.1 dataset files use a source/evidence classification structure. Field names may vary slightly by dataset, but the canonical field model includes:

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

## Educational Scope

This project may include:

* terminology references
* safety cautions
* device-category context
* buyer-education context
* measurement concepts
* claim-boundary notes
* dataset maintenance notes

This project does not provide:

* medical advice
* diagnosis
* treatment guidance
* disease-prevention guidance
* cure claims
* dosing protocols
* personalized healthcare instructions

## Suggested Citation

Holistix. “Holistix Open Biohacking Data Project.” Holistix International. https://www.holistixintl.com/pages/open-biohacking-data-index

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only. It is not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing guidance, or a substitute for consultation with a qualified healthcare professional.

Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
