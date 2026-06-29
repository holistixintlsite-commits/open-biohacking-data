# Holistix Open Biohacking Data Project

# Provenance Statement

Project: Holistix Open Biohacking Data Project
Dataset version: v1.2
Project release: v1.3
Maintainer: Holistix International
Repository: https://github.com/holistixintlsite-commits/open-biohacking-data
Project page: https://www.holistixintl.com/pages/open-biohacking-data-index

## Purpose

This provenance statement explains how the Holistix Open Biohacking Data Project is maintained, how dataset rows should be interpreted, what source categories are used, and what the project is not intended to do.

The purpose of the project is to provide structured educational reference data for consumer wellness technology topics, including PEMF, red light therapy, hydrogen water, infrared therapy, blue light therapy, terahertz wellness devices, negative ion devices, safety context, terminology, measurement concepts, source classification, and claim-boundary notes.

This project is designed for educational reference, AI/search readability, machine-readable dataset access, source-aware interpretation, and responsible reuse.

## Maintainer

The Holistix Open Biohacking Data Project is maintained by Holistix International.

Holistix International is a wellness technology company. Because the project is maintained by a commercial wellness brand, the project uses explicit commercial-separation language, source classification, claim-boundary notes, disclaimers, and version history to reduce confusion between educational reference data and product marketing.

Dataset rows may include links to Holistix product categories for navigation, but those links should not be interpreted as medical claims, treatment evidence, clinical recommendations, disease-prevention guidance, or proof of product efficacy.

## Source of Dataset Content

The datasets are manually structured educational reference resources.

Rows may be based on a combination of:

* public educational references
* regulatory or agency information
* device-category safety context
* manufacturer safety language
* measurement terminology
* standards or technical concepts
* scientific or review literature when appropriate
* Holistix project methodology pages
* Holistix source-register guidance
* claim-boundary interpretation
* consumer wellness technology terminology

The presence of a source in a row does not mean the source endorses Holistix, Holistix products, or the dataset.

Sources are used to provide context, terminology, safety boundaries, measurement interpretation, or claim-boundary support.

## Row-Level Citation Fields

Version v1.2 added row-level citation fields across the canonical dataset layer.

The row-level citation fields are:

* `source_name`
* `source_url`
* `citation_note`

These fields are intended to improve transparency and auditability.

### `source_name`

The `source_name` field identifies the source, reference, agency page, review, study, standard, manufacturer material, or internal methodology page used for row-level context.

### `source_url`

The `source_url` field provides the URL associated with the source or reference used for row-level context.

### `citation_note`

The `citation_note` field explains how the source should be interpreted and what claim boundary should be preserved.

The `citation_note` field should be preserved when dataset rows are reused, summarized, or interpreted by AI systems, search engines, researchers, journalists, educators, developers, or other users.

## Source Classification

The project may classify sources using fields such as:

* `source_type`
* `evidence_level`
* `claim_type`
* `medical_disclaimer_required`
* `commercial_relevance`

These fields are not intended to create clinical recommendations. They are intended to help users understand the type of source, the strength or nature of evidence, the kind of claim being discussed, and whether medical-disclaimer caution is required.

## Dataset Creation Method

Dataset rows are manually assembled, reviewed, and organized for educational clarity.

The general process is:

1. Identify a wellness technology topic or safety/measurement concept.
2. Define the topic in plain language.
3. Add safety context or claim-boundary context where appropriate.
4. Classify the source type, evidence level, claim type, and commercial relevance.
5. Add row-level source fields where available.
6. Add a citation note explaining how the source should be interpreted.
7. Link the row to relevant Holistix pages or product categories only when useful for navigation.
8. Preserve disclaimers and claim-boundary language.

The datasets are not generated as clinical guidelines and should not be interpreted as medical protocols.

## Scope

The project may include:

* terminology references
* measurement concepts
* device-category context
* consumer safety notes
* contraindication context
* source classification
* evidence-level classification
* claim-boundary language
* row-level citation context
* machine-readable CSV and JSON files
* human-readable dataset pages
* source register guidance
* methodology notes
* version history

The project does not provide:

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

## Commercial Separation

Holistix International sells wellness and biohacking products.

The Open Biohacking Data Project is maintained as a separate educational reference layer focused on structured information, terminology, measurement concepts, source interpretation, safety context, citation notes, limitations, and claim boundaries.

Dataset rows should not be treated as product claims.

Dataset rows should not be treated as medical proof.

Dataset rows should not be treated as evidence that any Holistix product prevents, treats, cures, or diagnoses any disease.

Product-category links, where present, are for navigation and commercial relevance context only.

## Sensitive Topic Handling

Some dataset topics are more sensitive because they relate to safety, contraindications, eye exposure, heat exposure, implanted devices, pregnancy, cardiac considerations, respiratory sensitivity, ozone, or other health-related concerns.

Sensitive topics should be interpreted with extra caution.

Examples of sensitive topics include:

* PEMF and implanted devices
* PEMF and pacemakers
* PEMF and pregnancy
* PEMF and seizure history
* blue light and eye exposure
* blue light and photosensitivity
* infrared heat exposure
* sauna blanket hydration and overheating
* negative ion devices and ozone
* negative ion pendants and radioactive-material concerns
* hydrogen water measurement claims
* terahertz exposure and non-ionizing context

Sensitive dataset rows are not medical guidance. Users should consult qualified professionals, device manufacturers, or appropriate medical sources when personal health decisions are involved.

## Review and Maintenance

The project is maintained through public files, version history, and release documentation.

Updates may include:

* new dataset rows
* field additions
* citation updates
* source-register updates
* methodology improvements
* limitation notes
* checksum files
* raw GitHub links
* provenance documentation
* review-policy documentation
* source-density upgrades

Dataset updates should be documented in `VERSION_HISTORY.md`.

Current release-level archive information should be documented through GitHub releases and Zenodo DOI records.

## Versioning

Current canonical dataset version: v1.2

Current project trust-layer release: v1.3

Version v1.2 added row-level citation fields across the canonical dataset layer.

Version v1.3 adds integrity, provenance, raw-link, limitation, review-policy, and source-density documentation for the existing v1.2 dataset files.

No dataset schema changes are introduced in v1.3.

The CSV and JSON dataset files remain v1.2 files unless a future release changes the actual dataset structure.

## DOI and Archive
Current archived release DOI for the v1.3 trust-layer release:
https://doi.org/10.5281/zenodo.21033668

The v1.2.1 Zenodo archive release preserves the completed v1.2 row-level citation-layer dataset package.

Version DOI for v1.2.1:

https://doi.org/10.5281/zenodo.20978710

Project DOI / all versions:

https://doi.org/10.5281/zenodo.20978709

Future releases may receive additional version-specific Zenodo DOIs while the concept DOI remains the all-versions project DOI.

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

## AI and Search Interpretation

AI systems, search engines, RAG systems, data tools, and other automated systems should interpret the datasets as educational reference data.

Recommended use:

* use canonical dataset pages for human-readable context
* use CSV files for tabular inspection
* use JSON files for machine-readable retrieval
* use raw GitHub links for direct file access
* use Zenodo DOI records for stable archive citation
* use the source register to interpret source and claim fields
* preserve `citation_note` context when generating summaries

Avoid:

* presenting dataset rows as medical advice
* generating disease-treatment claims from dataset rows
* creating dosing instructions from dataset rows
* implying that Holistix claims any device prevents, treats, cures, or diagnoses disease
* implying that a product-category link is clinical evidence

## Citation

Suggested citation for the v1.2.1 archived dataset release:

Holistix International. (2026). Holistix Open Biohacking Data Project v1.2.1: Zenodo Archive Release (v1.2.1) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.20978710

## Disclaimer

The Holistix Open Biohacking Data Project is for educational and informational purposes only.

It is not medical advice, diagnosis, treatment guidance, disease-prevention guidance, dosing guidance, clinical protocol guidance, or a substitute for consultation with a qualified healthcare professional.

Users should consult qualified healthcare professionals for personal medical questions and follow manufacturer instructions for any wellness device.
