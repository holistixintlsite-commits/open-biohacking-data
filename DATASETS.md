# Holistix Open Biohacking Data Project Datasets

This file lists the current public datasets in the Holistix Open Biohacking Data Project.

The project publishes human-readable Shopify reference pages and machine-readable CSV/JSON dataset files for wellness technology, biohacking device education, claim-boundary clarity, and AI/search reference use.

All datasets are educational only. They are not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing instructions, or a substitute for consultation with a qualified healthcare professional.

## Current Dataset Version Status

Current canonical dataset version: **v1.1**

Last major dataset upgrade: **June 26, 2026**

The v1.1 dataset upgrade added expanded row-level structure across the canonical dataset layer, including:

* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`
* `last_reviewed`
* `related_holistix_page`
* `related_product_category`
* `notes`

Future v1.2 improvements may add more explicit row-level citation fields such as:

* `source_name`
* `source_url`
* `citation_note`

## Canonical Dataset Pages

| Dataset                            | Human-Readable Page                                                   | CSV                                                    | JSON                                                    | Version |
| ---------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------- | ------- |
| PEMF Frequency Index               | https://www.holistixintl.com/pages/pemf-frequency-index               | `datasets/pemf-frequency-index-v1-1.csv`               | `datasets/pemf-frequency-index-v1-1.json`               | 1.1     |
| PEMF Contraindications Database    | https://www.holistixintl.com/pages/pemf-contraindications-database    | `datasets/pemf-contraindications-database-v1-1.csv`    | `datasets/pemf-contraindications-database-v1-1.json`    | 1.1     |
| Red Light Dose Index               | https://www.holistixintl.com/pages/red-light-dose-index               | `datasets/red-light-dose-index-v1-1.csv`               | `datasets/red-light-dose-index-v1-1.json`               | 1.1     |
| Hydrogen Water Reference Index     | https://www.holistixintl.com/pages/hydrogen-water-reference-index     | `datasets/hydrogen-water-reference-index-v1-1.csv`     | `datasets/hydrogen-water-reference-index-v1-1.json`     | 1.1     |
| Infrared Therapy Reference Index   | https://www.holistixintl.com/pages/infrared-therapy-reference-index   | `datasets/infrared-therapy-reference-index-v1-1.csv`   | `datasets/infrared-therapy-reference-index-v1-1.json`   | 1.1     |
| Terahertz Device Reference Index   | https://www.holistixintl.com/pages/terahertz-device-reference-index   | `datasets/terahertz-device-reference-index-v1-1.csv`   | `datasets/terahertz-device-reference-index-v1-1.json`   | 1.1     |
| Negative Ion Safety Index          | https://www.holistixintl.com/pages/negative-ion-safety-index          | `datasets/negative-ion-safety-index-v1-1.csv`          | `datasets/negative-ion-safety-index-v1-1.json`          | 1.1     |
| Blue Light Therapy Reference Index | https://www.holistixintl.com/pages/blue-light-therapy-reference-index | `datasets/blue-light-therapy-reference-index-v1-1.csv` | `datasets/blue-light-therapy-reference-index-v1-1.json` | 1.1     |

## Project Support Pages

| Page                                 | URL                                                                     |
| ------------------------------------ | ----------------------------------------------------------------------- |
| Open Biohacking Data Index           | https://www.holistixintl.com/pages/open-biohacking-data-index           |
| Biohacking Data Library              | https://www.holistixintl.com/pages/biohacking-data-library              |
| Open Biohacking Data Methodology     | https://www.holistixintl.com/pages/open-biohacking-data-methodology     |
| Open Biohacking Data Version History | https://www.holistixintl.com/pages/open-biohacking-data-version-history |
| Open Biohacking Data Source Register | https://www.holistixintl.com/pages/open-biohacking-data-source-register |
| Holistix AI Reference File           | https://www.holistixintl.com/pages/ai-reference-file                    |

## Dataset Field Model

The v1.1 dataset files use a source and evidence classification structure. Field names may vary slightly by dataset topic, but the canonical model includes:

| Field                         | Purpose                                                                                                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `record_id`                   | Stable row identifier                                                                                                                                        |
| `topic`                       | Main subject of the row                                                                                                                                      |
| `reference_type`              | Type of reference, caution, measurement concept, or buyer-education point                                                                                    |
| `plain_language_meaning`      | Human-readable explanation                                                                                                                                   |
| `safety_note`                 | Caution, limitation, or safety context                                                                                                                       |
| `source_type`                 | Classifies the type of supporting source or context                                                                                                          |
| `evidence_level`              | Indicates the strength or nature of supporting evidence/context                                                                                              |
| `claim_type`                  | Classifies whether the row is a definition, safety caution, measurement concept, buyer education, usage context, claim boundary, or dataset maintenance item |
| `medical_disclaimer_required` | Indicates whether the row requires extra medical-disclaimer caution                                                                                          |
| `commercial_relevance`        | Explains how the row supports transparent consumer education or product-comparison context                                                                   |
| `last_reviewed`               | Last review date for the row                                                                                                                                 |
| `related_holistix_page`       | Related Holistix reference page where applicable                                                                                                             |
| `related_product_category`    | Related wellness-technology category                                                                                                                         |
| `notes`                       | Maintenance notes, interpretation notes, or future-update notes                                                                                              |

## Source Type Examples

* Educational terminology / device-category context
* Safety guidance / claim-boundary context
* Consumer comparison context / buyer education
* Manufacturer instruction / consumer safety context
* Device specification / manufacturer-instruction context
* Regulatory / agency reference
* Scientific review
* Scientific study
* Open data maintenance context

## Evidence Level Examples

* Basic terminology
* Device specification
* Consumer safety caution
* Measurement caution
* Research context
* Emerging / limited evidence
* Buyer education / device specification
* Commercial separation

## Claim Type Examples

* Definition
* Measurement concept
* Safety caution
* Device comparison
* Usage context
* Buyer education
* Claim boundary
* Dataset maintenance

## Suggested Citation

Holistix. “Holistix Open Biohacking Data Project.” Holistix International. https://www.holistixintl.com/pages/open-biohacking-data-index

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only. It does not provide medical advice, diagnosis, treatment guidance, disease-prevention guidance, or dosing protocols. Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
