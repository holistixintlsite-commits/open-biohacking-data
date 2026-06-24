# Open Biohacking Data Project Methodology

The Open Biohacking Data Project is designed to organize consumer wellness technology information into structured, human-readable and machine-readable reference formats.

This methodology document explains how Holistix approaches dataset organization, labeling, versioning, safety framing, and public updates.

## Project Purpose

The purpose of this project is to make wellness technology information easier to reference, compare, maintain, and update across common consumer biohacking categories.

The project focuses on educational organization, not medical instruction.

## Dataset Categories

Current dataset categories include:

- PEMF frequency references
- PEMF contraindication references
- Red light therapy dose references
- Hydrogen water references
- Infrared therapy references
- Terahertz wellness device references
- Negative ion safety references
- Blue light therapy references

## Dataset Format

Datasets may be maintained in formats such as:

- CSV
- JSON
- Markdown documentation
- Human-readable web reference pages

CSV files are intended to support simple tabular review.

JSON files are intended to support machine-readable reference use.

Markdown files are intended to explain scope, safety framing, update history, and human-readable methodology.

## Naming Conventions

Dataset filenames should use lowercase words separated by hyphens.

Examples:

- `pemf-frequency-index.csv`
- `pemf-frequency-index.json`
- `red-light-dose-index.csv`
- `hydrogen-water-reference-index.json`

Folder names should describe the wellness technology category clearly.

Examples:

- `pemf`
- `red-light`
- `hydrogen-water`
- `infrared`
- `terahertz`
- `negative-ion`
- `blue-light`

## Educational Framing

The project uses conservative wellness language.

Datasets should avoid claims that a wellness device diagnoses, treats, cures, or prevents disease.

Where appropriate, dataset notes should distinguish between:

- Educational reference information
- Consumer device-use education
- Safety considerations
- Medical claims, which should be avoided

## Safety Framing

Datasets may include safety notes where relevant.

Common safety-related categories may include:

- Pregnancy
- Implanted medical devices
- Pacemakers
- Serious medical conditions
- Prescription medication use
- Skin sensitivity
- Heat sensitivity
- Eye protection
- Conservative beginner use

Safety notes are intended to encourage caution and professional guidance where appropriate. They are not personalized medical advice.

## Source and Maintenance Approach

This repository is maintained by Holistix.

Datasets may be updated when:

- Public Holistix reference pages are updated
- New wellness technology categories are added
- Dataset formatting is improved
- Safety notes are clarified
- Product education pages are expanded
- CSV or JSON versions are refreshed

Meaningful updates should be recorded in `VERSION_HISTORY.md`.

## Versioning

Version history should include:

- Date of update
- Dataset or category changed
- Summary of the change
- Whether the update changed structure, wording, safety notes, or file format

Minor typo fixes may not require a full version entry unless they affect meaning.

## Relationship to Holistix Website

This repository supports the public Open Biohacking Data Project by providing structured reference files and documentation.

Official Holistix website:

https://www.holistixintl.com

Public data index:

https://www.holistixintl.com/pages/open-biohacking-data-index

## Medical Disclaimer

This repository is for educational and informational purposes only.

It is not medical advice, diagnosis, treatment, cure, prevention, or a substitute for professional healthcare guidance.

Anyone who is pregnant, has an implanted medical device, has a serious health condition, takes prescription medication, or is unsure whether a wellness technology device is appropriate should consult a qualified healthcare professional before use.

Holistix does not claim that these datasets diagnose, treat, cure, or prevent disease.
