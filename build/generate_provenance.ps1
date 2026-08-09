param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$outputPath = Join-Path $Root "provenance.generated.json"

$inputs = @(
    "project_metadata.json",
    "datapackage.json",
    "project_identity.json",
    "supersession_registry.json",
    "catalog.jsonld",
    "ro-crate-metadata.json",
    "DATA_DICTIONARY.md",
    "CHANGELOG.md"
)

$generators = @(
    "build/generate_interoperability.ps1",
    "build/generate_catalog_jsonld.ps1",
    "build/generate_ro_crate.ps1",
    "build/generate_jsonl.ps1",
    "build/generate_project_identity.ps1",
    "build/generate_supersession_registry.ps1"
)

function Get-NormalizedTextBytes {
    param(
        [string]$FullPath
    )

    $text = Get-Content $FullPath -Raw

    $text = $text.Replace("`r`n", "`n").Replace("`r", "`n")

    return [System.Text.UTF8Encoding]::new($false).GetBytes($text)
}

function Get-Sha256Hex {
    param(
        [byte[]]$Bytes
    )

    $sha = [System.Security.Cryptography.SHA256]::Create()

    try {
        $hashBytes = $sha.ComputeHash($Bytes)
        return ([System.BitConverter]::ToString($hashBytes)).Replace("-", "").ToLowerInvariant()
    }
    finally {
        $sha.Dispose()
    }
}

function Get-RelativeSha256Record {
    param(
        [string]$RelativePath
    )

    $fullPath = Join-Path $Root $RelativePath

    if (-not (Test-Path $fullPath)) {
        throw "Required provenance input not found: $RelativePath"
    }

    $bytes = Get-NormalizedTextBytes -FullPath $fullPath
    $hash = Get-Sha256Hex -Bytes $bytes

    return [ordered]@{
        path = $RelativePath.Replace("\", "/")
        sha256 = $hash
        bytes = $bytes.Length
        hash_normalization = "UTF-8 without BOM; LF line endings"
    }
}

$inputRecords = @(
    foreach ($path in $inputs) {
        Get-RelativeSha256Record -RelativePath $path
    }
)

$generatorRecords = @(
    foreach ($path in $generators) {
        Get-RelativeSha256Record -RelativePath $path
    }
)

$jsonlFiles = Get-ChildItem (Join-Path $Root "data\jsonl\v1.2") -Filter "*.jsonl" -File |
    Sort-Object Name

$jsonlRecords = @(
    foreach ($file in $jsonlFiles) {
        $relative = "data/jsonl/v1.2/$($file.Name)"
        Get-RelativeSha256Record -RelativePath $relative
    }
)

$provenance = [ordered]@{
    project = "Holistix Open Biohacking Data Project"

    release = [ordered]@{
        project_version = "1.5.0"
        dataset_version = "1.2"
        status = "published"
        release_doi = "10.5281/zenodo.21862535"
        concept_doi = "10.5281/zenodo.20978709"
    }

    generation = [ordered]@{
        deterministic = $true
        generated_by = "PowerShell build pipeline"
        generated_artifact = "provenance.generated.json"
        self_hash_excluded = $true
        source_revision_embedded = $false
        text_hash_normalization = "UTF-8 without BOM; LF line endings"
    }

    inputs = $inputRecords
    generators = $generatorRecords
    jsonl_outputs = $jsonlRecords

    provenance_policy = [ordered]@{
        records_file_hashes = $true
        records_generator_hashes = $true
        records_jsonl_hashes = $true
        hashes_normalized_text_content = $true
        avoids_self_referential_hashing = $true
        avoids_unreleased_git_commit_binding = $true
        release_doi_matches_published_release = $true
    }
}

$json = $provenance | ConvertTo-Json -Depth 100

[System.IO.File]::WriteAllText(
    $outputPath,
    $json + "`n",
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "GENERATED PROVENANCE PASSED"
Write-Host "---------------------------"
Write-Host "Project version:" $provenance.release.project_version
Write-Host "Dataset version:" $provenance.release.dataset_version
Write-Host "Release status:" $provenance.release.status
Write-Host "Input files:" $provenance.inputs.Count
Write-Host "Generator files:" $provenance.generators.Count
Write-Host "JSONL outputs:" $provenance.jsonl_outputs.Count
Write-Host "Hash normalization:" $provenance.generation.text_hash_normalization
Write-Host "Self hash excluded:" $provenance.generation.self_hash_excluded
Write-Host "Output:" $outputPath
