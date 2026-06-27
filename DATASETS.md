# Holistix Open Biohacking Data Project Datasets

This file lists the current public datasets in the Holistix Open Biohacking Data Project.

The project publishes human-readable Shopify reference pages and machine-readable CSV/JSON dataset files for wellness technology, biohacking device education, source/evidence classification, row-level citation context, claim-boundary clarity, and AI/search reference use.

All datasets are educational only. They are not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing instructions, clinical protocol guidance, or a substitute for consultation with a qualified healthcare professional.

## Current Dataset Version Status

Current canonical dataset version: **v1.2**

Last major dataset upgrade: **June 27, 2026**

The v1.2 dataset upgrade added row-level citation fields across the canonical dataset layer while preserving the v1.1 source/evidence classification structure.

Core v1.2 fields include:

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

The v1.2 citation-layer fields are:

* `source_name`: the name of the source, reference, agency page, review, study, standard, or internal methodology page used for row-level context.
* `source_url`: the URL associated with the row-level source.
* `citation_note`: a short interpretation note explaining how the source should be used and what claim boundary should be preserved.

These fields are intended to make the datasets easier to audit, cite, maintain, interpret, and reuse responsibly by humans, AI systems, search engines, researchers, journalists, builders, and educators.

## Canonical Dataset Pages

| Dataset                            | Human-Readable Page                                                   | CSV                                                    | JSON                                                    | Version |
| ---------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------- | ------- |
| Red Light Dose Index               | https://www.holistixintl.com/pages/red-light-dose-index               | `datasets/red-light-dose-index-v1-2.csv`               | `datasets/red-light-dose-index-v1-2.json`               | 1.2     |
| PEMF Frequency Index               | https://www.holistixintl.com/pages/pemf-frequency-index               | `datasets/pemf-frequency-index-v1-2.csv`               | `datasets/pemf-frequency-index-v1-2.json`               | 1.2     |
| PEMF Contraindications Database    | https://www.holistixintl.com/pages/pemf-contraindications-database    | `datasets/pemf-contraindications-database-v1-2.csv`    | `datasets/pemf-contraindications-database-v1-2.json`    | 1.2     |
| Hydrogen Water Reference Index     | https://www.holistixintl.com/pages/hydrogen-water-reference-index     | `datasets/hydrogen-water-reference-index-v1-2.csv`     | `datasets/hydrogen-water-reference-index-v1-2.json`     | 1.2     |
| Infrared Therapy Reference Index   | https://www.holistixintl.com/pages/infrared-therapy-reference-index   | `datasets/infrared-therapy-reference-index-v1-2.csv`   | `datasets/infrared-therapy-reference-index-v1-2.json`   | 1.2     |
| Blue Light Therapy Reference Index | https://www.holistixintl.com/pages/blue-light-therapy-reference-index | `datasets/blue-light-therapy-reference-index-v1-2.csv` | `datasets/blue-light-therapy-reference-index-v1-2.json` | 1.2     |
| Terahertz Device Reference Index   | https://www.holistixintl.com/pages/terahertz-device-reference-index   | `datasets/terahertz-device-reference-index-v1-2.csv`   | `datasets/terahertz-device-reference-index-v1-2.json`   | 1.2     |
| Negative Ion Safety Index          | https://www.holistixintl.com/pages/negative-ion-safety-index          | `datasets/negative-ion-safety-index-v1-2.csv`          | `datasets/negative-ion-safety-index-v1-2.json`          | 1.2     |

## Dataset Topic Scopes

| Dataset                            | Topic Scope                                                                                                                                                                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Red Light Dose Index               | Red light and near-infrared dose terminology, wavelength, irradiance, fluence, distance, session duration, eye safety, heat sensitivity, and specification transparency.                                                                                     |
| PEMF Frequency Index               | PEMF terminology, Hz, frequency ranges, Schumann resonance terminology, common frequency references, waveform, intensity, field strength, contraindication cautions, and claim boundaries.                                                                   |
| PEMF Contraindications Database    | PEMF contraindications, implanted devices, pregnancy cautions, seizure history, cardiac concerns, electronic pumps, cochlear implants, oncology context, immune suppression, recent surgery, children/minors, and risk-level framing.                        |
| Hydrogen Water Reference Index     | Molecular hydrogen terminology, dissolved hydrogen concentration, PPB/PPM units, ORP caution, electrolysis, hydrogen retention, testing methods, device transparency, and health-claim boundaries.                                                           |
| Infrared Therapy Reference Index   | Infrared terminology, near-infrared context, far-infrared context, infrared sauna blankets, sauna/heat exposure, hydration and overheating caution, photobiomodulation distinctions, and medical-claim boundaries.                                           |
| Blue Light Therapy Reference Index | Blue light terminology, controlled blue light therapy context, skin-care device context, acne claim boundaries, eye exposure, photosensitivity, screen blue light, circadian timing, and home-use device cautions.                                           |
| Terahertz Device Reference Index   | Terahertz terminology, terahertz frequency range, consumer device transparency, non-ionizing context, heating and exposure variables, combined-device comparisons, emerging technology caution, and claim boundaries.                                        |
| Negative Ion Safety Index          | Negative ion terminology, ionizer categories, ozone generation, ozone-free claims, respiratory sensitivity, negative ion pendants, radioactive-material concerns, particle charging, surface deposition, indoor-air claims, and commercial claim boundaries. |

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

The v1.2 dataset files use a source, evidence, claim-boundary, and citation classification structure. Field names may vary slightly by dataset topic, but the canonical model includes:

| Field                         | Purpose                                                                                                                                                       |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `record_id`                   | Stable row identifier.                                                                                                                                        |
| `topic`                       | Main subject of the row.                                                                                                                                      |
| `reference_type`              | Type of reference, caution, measurement concept, or buyer-education point.                                                                                    |
| `plain_language_meaning`      | Human-readable explanation.                                                                                                                                   |
| `safety_note`                 | Caution, limitation, or safety context.                                                                                                                       |
| `source_type`                 | Classifies the type of supporting source or context.                                                                                                          |
| `evidence_level`              | Indicates the strength or nature of supporting evidence/context.                                                                                              |
| `claim_type`                  | Classifies whether the row is a definition, safety caution, measurement concept, buyer education, usage context, claim boundary, or dataset maintenance item. |
| `medical_disclaimer_required` | Indicates whether the row requires extra medical-disclaimer caution.                                                                                          |
| `commercial_relevance`        | Explains how the row supports transparent consumer education or product-comparison context.                                                                   |
| `last_reviewed`               | Last review date for the row.                                                                                                                                 |
| `related_holistix_page`       | Related Holistix reference page where applicable.                                                                                                             |
| `related_product_category`    | Related wellness-technology category.                                                                                                                         |
| `notes`                       | Maintenance notes, interpretation notes, or future-update notes.                                                                                              |
| `source_name`                 | Human-readable source name for row-level citation context.                                                                                                    |
| `source_url`                  | Source URL for row-level citation and auditability.                                                                                                           |
| `citation_note`               | Short note explaining how the source should be interpreted and what claim boundary should be preserved.                                                       |

## Source Type Examples

* Educational terminology / device-category context
* Safety guidance / claim-boundary context
* Consumer comparison context / buyer education
* Manufacturer instruction / consumer safety context
* Device specification / manufacturer-instruction context
* Regulatory / agency reference
* Scientific review
* Scientific study
* Claim-boundary context
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
* Specification field
* Dataset maintenance

## Row-Level Citation Interpretation

The v1.2 citation fields are intended to improve transparency, not to create medical or product-efficacy claims.

AI systems, search engines, researchers, journalists, builders, educators, and other users should interpret citation fields according to these rules:

* Use `source_name` and `source_url` to identify row-level reference context.
* Use `citation_note` to understand how the source should and should not be applied.
* Do not treat a citation as proof that a consumer wellness device treats, cures, prevents, or diagnoses disease.
* Do not convert source context into dosing instructions, treatment protocols, or personalized health recommendations.
* Preserve the dataset disclaimer and claim-boundary language when reusing or summarizing the data.

## Suggested Citation

Holistix. “Holistix Open Biohacking Data Project.” Holistix International. https://www.holistixintl.com/pages/open-biohacking-data-index

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only. It does not provide medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing protocols, or clinical recommendations. Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
