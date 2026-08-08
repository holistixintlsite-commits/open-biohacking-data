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

    draft_successor = [ordered]@{
        version = $identity.release.project_version
        doi = $null
        status = $identity.release.release_status
        relation = "draft-successor-to"
        predecessor_version = $identity.current_public_release.project_version
        predecessor_doi = $identity.current_public_release.release_doi
    }

    release_lineage = @(
        [ordered]@{
            version = "1.4"
            doi = $metadata.identifiers.current_release_doi
            status = "published"
            supersedes_version = "1.3"
            supersedes_doi = $metadata.identifiers.previous_v1_3_doi
        },
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
Write-Host "Draft successor:" $registry.draft_successor.version
Write-Host "Draft DOI:" $(if ($null -eq $registry.draft_successor.doi) { "NULL" } else { $registry.draft_successor.doi })
Write-Host "Historical releases:" $registry.release_lineage.Count
Write-Host "Excluded archives:" $registry.excluded_from_current_lineage.Count
Write-Host "Output:" $outputPath
