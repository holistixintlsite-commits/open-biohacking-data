# Deployment Checklist

## Do not upload this entire ZIP to Shopify

Upload only public files from `public-data/` after final URL and evidence validation.

## Sequence

1. Review `audit/VALIDATION_SUMMARY.txt`.
2. Confirm product names/specifications in `public-data/master/`.
3. Confirm Shopify handles in `content_registry.json`.
4. Verify specific citations for claims marked `requires_context`.
5. Upload versioned CSV/JSON files to Shopify Content > Files.
6. Update the Open Biohacking Data Index once with final file URLs.
7. Add or update the five proposed website index pages.
8. Commit the release folder to GitHub.
9. Publish Zenodo v1.4 and record both version DOI and concept DOI.
10. Run the Swarm audit afterward.
