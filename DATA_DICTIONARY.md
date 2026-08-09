# Holistix Open Biohacking Data Dictionary

Project release: **v1.5.0**

Canonical subject dataset release: **v1.2**

Release status: **published**

This document is generated from the tabular schemas embedded in datapackage.json.

> This dictionary documents structure and representation. It does not establish scientific validation, medical evidence, product endorsement, or clinical efficacy.

## Schema Principles

- Dataset structure is derived from the canonical v1.2 CSV files.
- Field types describe current machine-readable representation.
- Project and subject dataset versions are independently managed.
- Row-level citation fields preserve source attribution and citation context.
- Dataset-specific structural differences are preserved.

## Blue Light Therapy Reference Index

Resource name: blue-light-therapy-reference-index-v1.2-csv

Path: data/datasets/v1.2/blue-light-therapy-reference-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Hydrogen Water Reference Index

Resource name: hydrogen-water-reference-index-v1.2-csv

Path: data/datasets/v1.2/hydrogen-water-reference-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Infrared Therapy Reference Index

Resource name: infrared-therapy-reference-index-v1.2-csv

Path: data/datasets/v1.2/infrared-therapy-reference-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Negative Ion Safety Index

Resource name: negative-ion-safety-index-v1.2-csv

Path: data/datasets/v1.2/negative-ion-safety-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Pemf Contraindications Database

Resource name: pemf-contraindications-database-v1.2-csv

Path: data/datasets/v1.2/pemf-contraindications-database-v1.2.csv

Dataset version: 1.2

Field count: 16

| Field | Type |
|---|---|
| record_id | string |
| contraindication_or_caution | string |
| risk_level | string |
| recommendation | string |
| plain_language_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Pemf Frequency Index

Resource name: pemf-frequency-index-v1.2-csv

Path: data/datasets/v1.2/pemf-frequency-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Red Light Dose Index

Resource name: red-light-dose-index-v1.2-csv

Path: data/datasets/v1.2/red-light-dose-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Terahertz Device Reference Index

Resource name: terahertz-device-reference-index-v1.2-csv

Path: data/datasets/v1.2/terahertz-device-reference-index-v1.2.csv

Dataset version: 1.2

Field count: 17

| Field | Type |
|---|---|
| record_id | string |
| topic | string |
| reference_type | string |
| plain_language_meaning | string |
| safety_note | string |
| source_type | string |
| evidence_level | string |
| claim_type | string |
| medical_disclaimer_required | string |
| commercial_relevance | string |
| last_reviewed | string |
| related_holistix_page | string |
| related_product_category | string |
| notes | string |
| source_name | string |
| source_url | string |
| citation_note | string |

## Cross-Dataset Field Matrix

This matrix shows which fields occur in each canonical subject dataset.

| Field | blue-light-therapy | hydrogen-water | infrared-therapy | negative-ion-safety | pemf-contraindications | pemf-frequency | red-light-dose | terahertz-device |
|---|---|---|---|---|---|---|---|---|
| citation_note | YES | YES | YES | YES | YES | YES | YES | YES |
| claim_type | YES | YES | YES | YES | YES | YES | YES | YES |
| commercial_relevance | YES | YES | YES | YES | YES | YES | YES | YES |
| contraindication_or_caution |  |  |  |  | YES |  |  |  |
| evidence_level | YES | YES | YES | YES | YES | YES | YES | YES |
| last_reviewed | YES | YES | YES | YES | YES | YES | YES | YES |
| medical_disclaimer_required | YES | YES | YES | YES | YES | YES | YES | YES |
| notes | YES | YES | YES | YES | YES | YES | YES | YES |
| plain_language_meaning | YES | YES | YES | YES |  | YES | YES | YES |
| plain_language_note |  |  |  |  | YES |  |  |  |
| recommendation |  |  |  |  | YES |  |  |  |
| record_id | YES | YES | YES | YES | YES | YES | YES | YES |
| reference_type | YES | YES | YES | YES |  | YES | YES | YES |
| related_holistix_page | YES | YES | YES | YES | YES | YES | YES | YES |
| related_product_category | YES | YES | YES | YES |  | YES | YES | YES |
| risk_level |  |  |  |  | YES |  |  |  |
| safety_note | YES | YES | YES | YES |  | YES | YES | YES |
| source_name | YES | YES | YES | YES | YES | YES | YES | YES |
| source_type | YES | YES | YES | YES | YES | YES | YES | YES |
| source_url | YES | YES | YES | YES | YES | YES | YES | YES |
| topic | YES | YES | YES | YES |  | YES | YES | YES |

## Citation Fields

- source_name: human-readable source identification.
- source_url: source location or reference URL.
- citation_note: row-specific citation or interpretation context.

These fields improve traceability but do not by themselves establish evidence quality, scientific validity, or claim substantiation.

## Machine-Readable Source

Authoritative interoperability representation: datapackage.json

Generator: build/generate_interoperability.ps1

Concept DOI: 10.5281/zenodo.20978709
