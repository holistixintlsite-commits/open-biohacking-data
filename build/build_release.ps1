param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$identityPath = Join-Path $Root "project_identity.json"
$packagePath = Join-Path $Root "datapackage.json"

if (-not (Test-Path $identityPath)) {
    throw "project_identity.json not found."
}

if (-not (Test-Path $packagePath)) {
    throw "datapackage.json not found."
}

$identity = Get-Content $identityPath -Raw | ConvertFrom-Json
$package = Get-Content $packagePath -Raw | ConvertFrom-Json

$projectVersion = $identity.release.project_version
$datasetVersion = $identity.release.dataset_version
$releaseStatus = $identity.release.release_status
$releaseDoi = $identity.release.release_doi
$conceptDoi = $identity.release.concept_doi

if ($projectVersion -ne "1.5.0") {
    throw "Expected project version 1.5.0 but found $projectVersion"
}

if ($datasetVersion -ne "1.2") {
    throw "Expected canonical dataset version 1.2 but found $datasetVersion"
}

if ($releaseStatus -ne "published") {
    throw "Expected release status published but found $releaseStatus"
}

if ($releaseDoi -ne "10.5281/zenodo.21862535") {
    throw "Published v1.5 release DOI must equal 10.5281/zenodo.21862535."
}

$stageRoot = Join-Path $Root "build\generated"
$stage = Join-Path $stageRoot "v1.5.0"

if (Test-Path $stageRoot) {
    Remove-Item $stageRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $stage | Out-Null

$textExtensions = @(
    ".json",
    ".jsonld",
    ".jsonl",
    ".csv",
    ".md",
    ".txt",
    ".cff",
    ".ps1",
    ".yml",
    ".yaml"
)

function Copy-CanonicalFile {
    param(
        [string]$Source,
        [string]$Destination
    )

    $destinationDirectory = Split-Path -Parent $Destination

    if (-not (Test-Path $destinationDirectory)) {
        New-Item -ItemType Directory -Force -Path $destinationDirectory | Out-Null
    }

    $extension = [System.IO.Path]::GetExtension($Source).ToLowerInvariant()

    if ($textExtensions -contains $extension) {
        $text = Get-Content $Source -Raw
        $text = $text.Replace("`r`n", "`n").Replace("`r", "`n")

        [System.IO.File]::WriteAllText(
            $Destination,
            $text,
            [System.Text.UTF8Encoding]::new($false)
        )
    }
    else {
        Copy-Item $Source $Destination -Force
    }
}

function Copy-CanonicalFolder {
    param(
        [string]$RelativeFolder
    )

    $sourceFolder = Join-Path $Root $RelativeFolder

    if (-not (Test-Path $sourceFolder)) {
        throw "Required source folder missing: $RelativeFolder"
    }

    Get-ChildItem $sourceFolder -Recurse -File | ForEach-Object {
        $relativePath = $_.FullName.Substring($sourceFolder.Length).TrimStart("\")
        $destination = Join-Path (Join-Path $stage $RelativeFolder) $relativePath

        Copy-CanonicalFile -Source $_.FullName -Destination $destination
    }
}

$coreFiles = @(
    "README.md",
    "CHANGELOG.md",
    "RELEASE_NOTES_v1.5.md",
    "LICENSE_DATA.txt",
    "CITATION.cff",
    "DEPLOYMENT_CHECKLIST.md",
    "VALIDATION_SUMMARY.txt",
    "WEBSITE_PUBLICATION_MAP.md",
    "VERSION_HISTORY.md",
    "KNOWN_LIMITATIONS.md",
    "METADATA_CORRECTION_2026-08-07.md",
    "project_metadata.json",
    "project_identity.json",
    "supersession_registry.json",
    "provenance.generated.json",
    "datapackage.json",
    "DATA_DICTIONARY.md",
    "catalog.jsonld",
    "ro-crate-metadata.json",
    "manifest.json",
    "ai-reference.md",
    "llms.txt"
)

foreach ($file in $coreFiles) {
    $source = Join-Path $Root $file

    if (-not (Test-Path $source)) {
        throw "Required source file missing: $file"
    }

    Copy-CanonicalFile `
        -Source $source `
        -Destination (Join-Path $stage $file)
}

$folders = @(
    "data",
    "schemas",
    "methodology"
)

foreach ($folder in $folders) {
    Copy-CanonicalFolder -RelativeFolder $folder
}

$toolingFiles = @(
    "build/generate_interoperability.ps1",
    "build/generate_catalog_jsonld.ps1",
    "build/generate_ro_crate.ps1",
    "build/generate_jsonl.ps1",
    "build/generate_project_identity.ps1",
    "build/generate_supersession_registry.ps1",
    "build/generate_provenance.ps1",
    "validation/validate_project_metadata.ps1"
)

foreach ($file in $toolingFiles) {
    $source = Join-Path $Root $file
    $destination = Join-Path $stage ("tooling/" + $file)

    if (-not (Test-Path $source)) {
        throw "Required tooling file missing: $file"
    }

    Copy-CanonicalFile -Source $source -Destination $destination
}

$jsonErrors = @()

Get-ChildItem $stage -Recurse -File |
    Where-Object {
        $_.Extension -eq ".json" -or $_.Extension -eq ".jsonld"
    } |
    ForEach-Object {
        try {
            Get-Content $_.FullName -Raw | ConvertFrom-Json | Out-Null
        }
        catch {
            $jsonErrors += $_.FullName
        }
    }

$jsonlErrors = @()
$jsonlRecordCount = 0

Get-ChildItem $stage -Recurse -File -Filter "*.jsonl" |
    ForEach-Object {
        $jsonlFile = $_.FullName
        $lineNumber = 0

        Get-Content $jsonlFile | ForEach-Object {
            $lineNumber++

            if ([string]::IsNullOrWhiteSpace($_)) {
                return
            }

            try {
                $_ | ConvertFrom-Json | Out-Null
                $script:jsonlRecordCount++
            }
            catch {
                $script:jsonlErrors += "${jsonlFile}:$lineNumber"
            }
        }
    }

if ($jsonErrors.Count -gt 0 -or $jsonlErrors.Count -gt 0) {
    Write-Host ""
    Write-Host "RELEASE BUILD FAILED"
    Write-Host "--------------------"

    foreach ($file in $jsonErrors) {
        Write-Host "FAIL JSON:" $file
    }

    foreach ($record in $jsonlErrors) {
        Write-Host "FAIL JSONL:" $record
    }

    exit 1
}

$hashLines = Get-ChildItem $stage -Recurse -File |
    Where-Object {
        $_.Name -ne "BUILD_MANIFEST_SHA256.txt"
    } |
    ForEach-Object {
        $relative = $_.FullName.Substring($stage.Length).TrimStart("\").Replace("\", "/")
        $hash = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
        "$hash  $relative"
    } |
    Sort-Object

$manifestOut = Join-Path $stage "BUILD_MANIFEST_SHA256.txt"

[System.IO.File]::WriteAllText(
    $manifestOut,
    (($hashLines -join "`n") + "`n"),
    [System.Text.UTF8Encoding]::new($false)
)

$packageFileCount = (
    Get-ChildItem $stage -Recurse -File
).Count

Write-Host ""
Write-Host "V1.5 RELEASE BUILD PASSED"
Write-Host "-------------------------------"
Write-Host "Project version:" $projectVersion
Write-Host "Dataset version:" $datasetVersion
Write-Host "Release status:" $releaseStatus
Write-Host "Release DOI:" $(if ($null -eq $releaseDoi) { "NULL" } else { $releaseDoi })
Write-Host "Concept DOI:" $conceptDoi
Write-Host "Data Package resources:" $package.resources.Count
Write-Host "JSONL records:" $jsonlRecordCount
Write-Host "JSON parse errors:" $jsonErrors.Count
Write-Host "JSONL parse errors:" $jsonlErrors.Count
Write-Host "Package files:" $packageFileCount
Write-Host "Generated package:"
Write-Host $stage
Write-Host "Build manifest:"
Write-Host $manifestOut

exit 0
