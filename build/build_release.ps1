param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$metadataPath = Join-Path $Root "project_metadata.json"

if (-not (Test-Path $metadataPath)) {
    throw "project_metadata.json not found."
}

$metadata = Get-Content $metadataPath -Raw | ConvertFrom-Json

$stageRoot = Join-Path $Root "build\generated"
$stage = Join-Path $stageRoot "current"

if (Test-Path $stageRoot) {
    Remove-Item $stageRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $stage | Out-Null

$coreFiles = @(
    "README.md",
    "RELEASE_NOTES_v1.4.md",
    "LICENSE_DATA.txt",
    "CITATION.cff",
    "DEPLOYMENT_CHECKLIST.md",
    "VALIDATION_SUMMARY.txt",
    "WEBSITE_PUBLICATION_MAP.md",
    "VERSION_HISTORY.md",
    "KNOWN_LIMITATIONS.md",
    "METADATA_CORRECTION_2026-08-07.md",
    "project_metadata.json",
    "manifest.json",
    "ai-reference.md",
    "llms.txt"
)

foreach ($file in $coreFiles) {
    $source = Join-Path $Root $file

    if (-not (Test-Path $source)) {
        throw "Required source file missing: $file"
    }

    Copy-Item $source (Join-Path $stage $file) -Force
}

$folders = @(
    "data",
    "schemas",
    "methodology"
)

foreach ($folder in $folders) {
    $source = Join-Path $Root $folder

    if (-not (Test-Path $source)) {
        throw "Required source folder missing: $folder"
    }

    Copy-Item $source (Join-Path $stage $folder) -Recurse -Force
}

# Parse every JSON file in the generated package.
$jsonErrors = @()

Get-ChildItem $stage -Recurse -File -Filter "*.json" |
    ForEach-Object {
        $jsonFile = $_.FullName

        try {
            Get-Content $jsonFile -Raw | ConvertFrom-Json | Out-Null
        }
        catch {
            $jsonErrors += $jsonFile
        }
    }

if ($jsonErrors.Count -gt 0) {
    Write-Host ""
    Write-Host "RELEASE BUILD FAILED"
    Write-Host "--------------------"

    foreach ($file in $jsonErrors) {
        Write-Host "FAIL JSON: $file"
    }

    exit 1
}

# Create deterministic SHA256 manifest.
$hashLines = Get-ChildItem $stage -Recurse -File |
    Where-Object {
        $_.Name -ne "BUILD_MANIFEST_SHA256.txt"
    } |
    ForEach-Object {
        $relative = $_.FullName.Substring($stage.Length).TrimStart("\")
        $hash = (Get-FileHash $_.FullName -Algorithm SHA256).Hash
        "$hash  $relative"
    } |
    Sort-Object

$manifestOut = Join-Path $stage "BUILD_MANIFEST_SHA256.txt"
$hashLines | Set-Content $manifestOut -Encoding utf8

Write-Host ""
Write-Host "RELEASE BUILD PASSED"
Write-Host "--------------------"
Write-Host "Project version:" $metadata.project.project_version
Write-Host "Dataset version:" $metadata.project.dataset_version
Write-Host "Release DOI:" $metadata.identifiers.current_release_doi
Write-Host "Generated package:"
Write-Host $stage
Write-Host "JSON parse errors: 0"
Write-Host "Build manifest:"
Write-Host $manifestOut

exit 0
