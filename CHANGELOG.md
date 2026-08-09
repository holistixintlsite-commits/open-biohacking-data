# Holistix Open Biohacking Data Project Changelog

This changelog records material project-level changes. Canonical subject datasets are versioned independently from project infrastructure.

## [1.5.0] - 2026-08-09

Status: Published

Canonical subject dataset version: v1.2

Predecessor project release: v1.4

Predecessor release DOI: 10.5281/zenodo.21574706

Concept DOI: 10.5281/zenodo.20978709

### Added

- Frictionless-style Data Package metadata in `datapackage.json`
- machine-readable tabular schemas for all eight canonical CSV datasets
- human-readable `DATA_DICTIONARY.md`
- Schema.org JSON-LD catalog in `catalog.jsonld`
- RO-Crate 1.2 metadata in `ro-crate-metadata.json`
- deterministic JSONL exports for all eight canonical datasets
- `project_identity.json` providing explicit project and release identity
- `supersession_registry.json` for explicit release lineage and superseded archive handling
- deterministic build scripts for all new interoperability artifacts
- GitHub Actions reproducibility checks for generated artifacts

### Changed

- Added explicit LF handling for JSONL files to improve cross-platform reproducibility
- Expanded CI validation to regenerate and compare interoperability outputs
- Formalized separation between project release version 1.5.0 and canonical subject dataset version 1.2

### Unchanged

- The eight canonical subject datasets remain at dataset version v1.2
- Project release v1.5.0 supersedes v1.4 as the current published release
- Current published release DOI is 10.5281/zenodo.21862535
- Concept DOI remains 10.5281/zenodo.20978709
- CC BY 4.0 remains the project data license

### Release boundary

Version 1.5.0 is the current published interoperability and reproducibility release.

v1.5 release DOI: 10.5281/zenodo.21862535

Version 1.5.0 supersedes v1.4. The v1.4 release DOI remains preserved in the project release lineage.

## [1.4] - 2026-07-25

Project release v1.4 expanded the project into a structured product and wellness-technology reference system while retaining the eight canonical subject datasets at v1.2.

Exact release DOI: 10.5281/zenodo.21574706

See `RELEASE_NOTES_v1.4.md` and `VERSION_HISTORY.md` for full historical details.
