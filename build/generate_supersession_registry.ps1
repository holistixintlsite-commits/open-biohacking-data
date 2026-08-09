param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$metadataPath = Join-Path $Root "project_metadata.json"
$identityPath = Join-Path $Root "project_identity.json"
$outputPath = Join-Path $Root "supersession_registry.json"

$metadata = Get-Content $metadataPath -Raw | ConvertFrom-Json
$identity = Get-Content $identityPath -Raw | ConvertFrom-Json

$registry = [ordered]@{
    project = "Holistix Open Biohacking Data Project"
    concept_doi = $metadata.identifiers.concept_doi
    canonical_metadata_source = "project_metadata.json"

    current_public_release = [ordered]@{
        version = $identity.current_public_release.project_version
        doi = $identity.current_public_release.release_doi
        status = "published"
    }

    previous_release = [ordered]@{
        version = "1.4"
        doi = "10.5281/zenodo.21574706"
        status = "historical"
        relation = "superseded-by-current"
        superseded_by_version = $identity.current_public_release.project_version
        superseded_by_doi = $identity.current_public_release.release_doi
    }

    release_lineage = @(
        [ordered]@{
            version = "1.3"
            doi = $metadata.identifiers.previous_v1_3_doi
            status = "historical"
            supersedes_version = "1.2.1"
            supersedes_doi = $metadata.identifiers.previous_v1_2_1_doi
        },
        [ordered]@{
            version = "1.2.1"
            doi = $metadata.identifiers.previous_v1_2_1_doi
            status = "historical"
            supersedes_version = $null
            supersedes_doi = $null
        }
    )

    excluded_from_current_lineage = @(
        [ordered]@{
            doi = $metadata.identifiers.superseded_software_archive_doi
            status = "superseded-noncanonical-archive"
            must_not_be_used_as_current = $true
        }
    )
}

$json = $registry | ConvertTo-Json -Depth 100

[System.IO.File]::WriteAllText(
    $outputPath,
    $json + "`n",
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "SUPERSESSION REGISTRY GENERATION PASSED"
Write-Host "---------------------------------------"
Write-Host "Current public release:" $registry.current_public_release.version
Write-Host "Current public DOI:" $registry.current_public_release.doi
Write-Host "Previous release:" $registry.previous_release.version
Write-Host "Previous release DOI:" $registry.previous_release.doi
Write-Host "Historical releases:" $registry.release_lineage.Count
Write-Host "Excluded archives:" $registry.excluded_from_current_lineage.Count
Write-Host "Output:" $outputPath
