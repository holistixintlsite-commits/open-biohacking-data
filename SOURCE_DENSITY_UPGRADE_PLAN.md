# Holistix Open Biohacking Data Project

# Source Density Upgrade Plan

Project: Holistix Open Biohacking Data Project
Dataset version: v1.2
Project release: v1.3
Maintainer: Holistix International
Repository: https://github.com/holistixintlsite-commits/open-biohacking-data
Project page: https://www.holistixintl.com/pages/open-biohacking-data-index

## Purpose

This document describes the planned source-density upgrade path for the Holistix Open Biohacking Data Project.

The goal is to improve source depth, citation clarity, auditability, and claim-boundary strength for the most sensitive and highest-impact dataset areas.

This plan is part of the v1.3 trust layer. It does not change the current v1.2 dataset schema. It provides a public roadmap for improving source coverage and review depth over future releases.

## What Source Density Means

Source density refers to the strength, number, relevance, and clarity of sources supporting a dataset row, topic group, or dataset section.

A stronger source-density layer may include:

* additional independent sources
* regulatory or agency references
* standards or technical references
* manufacturer safety documentation
* peer-reviewed reviews or studies where appropriate
* measurement references
* clearer row-level citation notes
* clearer claim-boundary language
* clearer safety context
* clearer source-type classification

The goal is not to add as many sources as possible.

The goal is to add the right sources where they improve clarity, safety, auditability, and responsible interpretation.

## Why This Matters

The Holistix Open Biohacking Data Project covers consumer wellness technology topics that may overlap with safety-sensitive or YMYL-adjacent areas.

Examples include:

* contraindications
* implanted devices
* eye exposure
* heat exposure
* respiratory sensitivity
* ozone
* pregnancy cautions
* seizure history
* cardiac concerns
* device-output measurement
* health-claim boundaries

For these topics, stronger source density helps users understand what a dataset row means, what it does not mean, and how it should be interpreted.

## Source-Density Principles

Future source upgrades should follow these principles:

1. Prioritize safety-sensitive rows first.
2. Prefer independent, regulatory, technical, or primary references where appropriate.
3. Preserve clear claim boundaries.
4. Avoid turning educational rows into medical recommendations.
5. Avoid implying product efficacy.
6. Avoid implying source endorsement of Holistix or Holistix products.
7. Preserve row-level `citation_note` context.
8. Update version history when meaningful source upgrades are made.
9. Keep commercial navigation separate from medical or safety claims.
10. Document sensitive-topic review status where appropriate.

## High-Priority Dataset Areas

The following dataset areas are highest priority for future source-density upgrades.

## 1. PEMF Contraindications Database

Priority level: Highest

Reason:

The PEMF Contraindications Database includes sensitive topics such as implanted devices, pacemakers, pregnancy, seizure history, cardiac concerns, electronic pumps, cochlear implants, oncology context, immune suppression, recent surgery, and children/minors.

These are high-caution areas and should have especially strong source context.

Priority rows or topic groups:

* pacemakers
* implanted electronic devices
* electronic pumps
* cochlear implants
* pregnancy
* seizure history
* cardiac considerations
* oncology context
* recent surgery
* children and minors

Preferred future source types:

* manufacturer safety manuals
* medical-device safety references
* regulatory or agency pages
* clinical or review literature where appropriate
* professional safety guidance
* electromagnetic compatibility references

Future upgrade goals:

* add stronger row-level sources for implanted-device cautions
* clarify that contraindication rows are not personalized medical advice
* distinguish between general device-category caution and clinical prohibition
* improve `citation_note` wording for sensitive rows
* add review-status notes where appropriate

## 2. Red Light Dose Index

Priority level: High

Reason:

The Red Light Dose Index includes terms such as wavelength, irradiance, fluence, distance, session duration, skin exposure, eye safety, and heat sensitivity.

Dose-related terminology can be easily misinterpreted as treatment guidance if boundaries are not clear.

Priority rows or topic groups:

* irradiance
* fluence
* wavelength
* distance
* session duration
* eye safety
* heat sensitivity
* photosensitivity context
* 660 nm and 850 nm terminology
* red light vs near-infrared distinction

Preferred future source types:

* photobiomodulation review literature
* technical measurement references
* device safety documentation
* eye-safety references
* manufacturer specification documentation
* standards or technical measurement guides where appropriate

Future upgrade goals:

* clarify that dose terminology is educational, not dosing instruction
* strengthen source context around fluence and irradiance
* improve safety notes around eyes and heat sensitivity
* add more measurement-focused citation notes
* support future explainer pages with stronger source context

## 3. Blue Light Therapy Reference Index

Priority level: High

Reason:

Blue light therapy topics may involve eye exposure, skin exposure, photosensitivity, acne-related claims, circadian timing, and home-use device safety.

These topics require careful claim boundaries.

Priority rows or topic groups:

* eye exposure
* photosensitivity
* acne device claims
* skin-care device context
* circadian timing
* screen blue light distinction
* home-use safety
* wavelength ranges

Preferred future source types:

* dermatology or phototherapy references
* device safety references
* eye exposure guidance
* photosensitivity cautions
* regulatory or agency material where appropriate
* review literature where appropriate

Future upgrade goals:

* strengthen eye-safety and photosensitivity citation notes
* clarify the distinction between controlled therapy devices and screen blue light
* avoid disease-treatment claims
* improve row-level source context for acne-related references
* add clearer consumer-device boundaries

## 4. Negative Ion Safety Index

Priority level: High

Reason:

Negative ion devices may overlap with ozone generation, indoor-air claims, respiratory sensitivity, radioactive-material concerns, surface deposition, and consumer safety.

This topic is highly prone to confusing or exaggerated claims.

Priority rows or topic groups:

* ozone generation
* ozone-free claims
* respiratory sensitivity
* ionizer categories
* negative ion pendants
* radioactive-material concerns
* indoor-air claims
* particle charging
* surface deposition

Preferred future source types:

* regulatory or agency ozone references
* indoor air quality references
* consumer product safety references
* technical references on ionization
* manufacturer safety documentation
* radiation/radioactive-material references where appropriate

Future upgrade goals:

* improve ozone-related source density
* strengthen radioactive-material caution rows
* clarify indoor-air claim boundaries
* distinguish negative ion pendant topics from room ionizer topics
* improve consumer safety notes

## 5. Infrared Therapy Reference Index

Priority level: Medium to high

Reason:

Infrared therapy topics may involve heat exposure, sauna blankets, hydration, overheating, temperature, near-infrared and far-infrared distinctions, and photobiomodulation terminology.

Heat-related risks should be clearly bounded.

Priority rows or topic groups:

* infrared sauna blankets
* hydration
* overheating
* heat sensitivity
* near-infrared
* far-infrared
* photobiomodulation distinction
* sauna exposure context
* device temperature context

Preferred future source types:

* heat exposure safety references
* sauna safety references
* manufacturer safety documentation
* photobiomodulation literature where appropriate
* technical references on infrared categories
* consumer safety references

Future upgrade goals:

* clarify heat exposure cautions
* strengthen hydration and overheating notes
* separate infrared heat context from red/NIR photobiomodulation context
* improve citation notes around sauna blankets
* avoid treatment or detox claims

## 6. Hydrogen Water Reference Index

Priority level: Medium to high

Reason:

Hydrogen water topics may involve dissolved hydrogen concentration, PPB, PPM, ORP, electrolysis, retention, testing methods, and measurement claims.

This topic is prone to exaggerated product claims and confusing measurement language.

Priority rows or topic groups:

* PPB
* PPM
* dissolved hydrogen concentration
* ORP caution
* electrolysis
* hydrogen retention
* testing methods
* device transparency
* concentration claims

Preferred future source types:

* molecular hydrogen measurement references
* technical measurement references
* peer-reviewed literature where appropriate
* device testing references
* manufacturer documentation
* chemistry references

Future upgrade goals:

* improve PPB/PPM source context
* clarify ORP limitations
* strengthen measurement and testing-method rows
* avoid implied treatment claims
* improve consumer-device transparency notes

## 7. Terahertz Device Reference Index

Priority level: Medium

Reason:

Consumer terahertz wellness devices are an emerging and confusing category. Topics may involve frequency range, non-ionizing context, heating, exposure variables, and claim boundaries.

This area needs especially careful language because consumer marketing can overstate certainty.

Priority rows or topic groups:

* terahertz frequency range
* non-ionizing context
* heating and exposure variables
* consumer device transparency
* emerging technology caution
* combined-device comparisons
* therapy claim boundaries

Preferred future source types:

* technical references on terahertz radiation
* non-ionizing radiation references
* exposure and heating references
* standards or technical sources where appropriate
* manufacturer transparency documents
* review literature where appropriate

Future upgrade goals:

* clarify non-ionizing does not automatically mean risk-free
* strengthen heating/exposure variable notes
* separate physics terminology from health claims
* improve citation notes around consumer wellness-device claims
* avoid implying established clinical efficacy

## 8. PEMF Frequency Index

Priority level: Medium

Reason:

The PEMF Frequency Index contains terminology such as Hz, frequency ranges, Schumann resonance terminology, waveform, intensity, field strength, and claim boundaries.

Frequency rows can be misused as treatment-prescription language if not clearly bounded.

Priority rows or topic groups:

* Hz
* frequency range
* Schumann resonance
* waveform
* intensity
* field strength
* frequency vs intensity
* claimed use categories
* consumer-device transparency

Preferred future source types:

* physics or technical references
* electromagnetic field measurement references
* manufacturer specifications
* review literature where appropriate
* standards or safety references where appropriate

Future upgrade goals:

* clarify that frequency references are educational, not treatment prescriptions
* strengthen frequency vs intensity notes
* improve field-strength and waveform source context
* avoid claim inflation around specific Hz values
* support future glossary and explainer pages

## Source Upgrade Workflow

Future source-density upgrades should follow this workflow:

1. Select one dataset or topic group.
2. Identify rows with the highest safety or claim-risk sensitivity.
3. Review current `source_name`, `source_url`, and `citation_note` fields.
4. Add or improve source references where needed.
5. Prefer sources that improve clarity and safety boundaries.
6. Update `citation_note` language to preserve claim boundaries.
7. Avoid adding sources that create misleading certainty.
8. Update the dataset CSV and JSON files if row fields change.
9. Update checksums after any dataset file changes.
10. Update version history.
11. Update Zenodo/GitHub release notes when appropriate.
12. Revalidate pages and machine-readable files.

## Source Preference Order

For sensitive rows, preferred source types generally include:

1. regulatory or agency sources
2. standards or technical references
3. manufacturer safety manuals or instructions
4. peer-reviewed reviews or studies where appropriate
5. university or institutional educational references
6. measurement or technical documentation
7. project methodology or source-register notes
8. commercial category references only for navigation or commercial relevance context

This preference order may vary by topic.

## What This Plan Does Not Do

This plan does not:

* create medical advice
* create treatment recommendations
* create disease-prevention guidance
* create dosing protocols
* create product-efficacy claims
* claim independent academic consensus
* claim expert medical review where none has occurred
* imply source endorsement of Holistix or Holistix products
* replace qualified professional guidance

## Future Release Targets

Potential future release themes may include:

### v1.3

Integrity, provenance, raw links, known limitations, review policy, and source-density roadmap.

### v1.4

High-priority source-density upgrade for PEMF contraindications and red light dose terminology.

### v1.5

Source-density upgrade for blue light safety, negative ion safety, and hydrogen measurement terminology.

### v1.6

Source-density upgrade for infrared heat safety, terahertz safety context, and PEMF frequency terminology.

Release numbering may change depending on project needs.

## Review and Authorship Connection

Source-density upgrades should be coordinated with the project review and authorship policy.

Sensitive topic pages and datasets may be marked for future expert review, advisory review, technical review, or claim-boundary review.

Review status should be documented clearly and should not imply endorsement of products.

## DOI and Archive Context

The v1.2.1 Zenodo archive release preserves the completed v1.2 row-level citation-layer dataset package.

Version DOI for v1.2.1:

https://doi.org/10.5281/zenodo.20978710

Project DOI / all versions:

https://doi.org/10.5281/zenodo.20978709

Future releases may receive additional version-specific Zenodo DOIs while the concept DOI remains the all-versions project DOI.

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only.

It is not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing guidance, clinical protocol guidance, or a substitute for consultation with a qualified healthcare professional.

Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
