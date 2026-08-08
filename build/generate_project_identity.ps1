param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$canonicalPath = Join-Path $Root "project_metadata.json"
$packagePath = Join-Path $Root "datapackage.json"
$outputPath = Join-Path $Root "project_identity.json"

$canonical = Get-Content $canonicalPath -Raw | ConvertFrom-Json
$package = Get-Content $packagePath -Raw | ConvertFrom-Json

$identity = [ordered]@{
    project_id = "holistix-open-biohacking-data-project"
    name = $canonical.project.name
    publisher = $canonical.project.publisher

    release = [ordered]@{
        project_version = $package.version
        dataset_version = $package.dataset_version
        release_status = $package.release_status
        release_doi = $null
        concept_doi = $canonical.identifiers.concept_doi
    }

    current_public_release = [ordered]@{
        project_version = $canonical.project.project_version
        release_status = $canonical.project.release_status
        release_date = $canonical.project.release_date
        release_doi = $canonical.identifiers.current_release_doi
    }

    locations = [ordered]@{
        homepage = $canonical.project.website
        repository = $canonical.repositories.github
    }

    license = [ordered]@{
        name = $canonical.license.name
        identifier = $canonical.license.identifier
        url = $canonical.license.url
    }

    identity_policy = [ordered]@{
        canonical_metadata_source = "project_metadata.json"
        draft_release_source = "datapackage.json"
        concept_doi_persists_across_releases = $true
        draft_release_doi_must_remain_null_until_deposition = $true
        subject_datasets_version_independently = $true
    }
}

$json = $identity | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText(
    $outputPath,
    $json + "`n",
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "PROJECT IDENTITY GENERATION PASSED"
Write-Host "----------------------------------"
Write-Host "Draft project version:" $identity.release.project_version
Write-Host "Dataset version:" $identity.release.dataset_version
Write-Host "Release status:" $identity.release.release_status
Write-Host "Draft DOI:" $(if ($null -eq $identity.release.release_doi) { "NULL" } else { $identity.release.release_doi })
Write-Host "Current public release:" $identity.current_public_release.project_version
Write-Host "Current public DOI:" $identity.current_public_release.release_doi
Write-Host "Concept DOI:" $identity.release.concept_doi
Write-Host "Output:" $outputPath
