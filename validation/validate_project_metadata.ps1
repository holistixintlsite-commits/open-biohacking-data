param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"
$errors = @()

function Add-Error {
    param([string]$Message)
    $script:errors += $Message
}

function Require-File {
    param([string]$RelativePath)

    $path = Join-Path $Root $RelativePath

    if (-not (Test-Path $path)) {
        Add-Error "Required file missing: $RelativePath"
        return $null
    }

    return $path
}

# ---------------------------------
# Canonical project metadata
# ---------------------------------

$metadataPath = Require-File "project_metadata.json"

if ($metadataPath) {
    try {
        $m = Get-Content $metadataPath -Raw | ConvertFrom-Json
    }
    catch {
        Add-Error "project_metadata.json is invalid JSON."
        $m = $null
    }
}

if ($m) {
    if ($m.project.project_version -ne "1.4") {
        Add-Error "Unexpected project version: $($m.project.project_version)"
    }

    if ($m.project.dataset_version -ne "1.2") {
        Add-Error "Unexpected dataset version: $($m.project.dataset_version)"
    }

    if ($m.project.release_status -ne "published") {
        Add-Error "Project release_status is not published."
    }

    if ($m.identifiers.current_release_doi -ne "10.5281/zenodo.21574706") {
        Add-Error "Unexpected current release DOI: $($m.identifiers.current_release_doi)"
    }

    if ($m.identifiers.concept_doi -ne "10.5281/zenodo.20978709") {
        Add-Error "Unexpected concept DOI: $($m.identifiers.concept_doi)"
    }

    if ($m.license.identifier -ne "CC-BY-4.0") {
        Add-Error "Unexpected license identifier: $($m.license.identifier)"
    }

    if ($m.metadata_policy.canonical_source -ne "project_metadata.json") {
        Add-Error "Canonical metadata source is not project_metadata.json."
    }
}

# ---------------------------------
# Repository project.json
# ---------------------------------

$projectPath = Require-File "data\master\project.json"

if ($projectPath) {
    try {
        $project = Get-Content $projectPath -Raw | ConvertFrom-Json

        if ($project.zenodo_latest -ne "https://zenodo.org/records/21574706") {
            Add-Error "Incorrect zenodo_latest in data\master\project.json: $($project.zenodo_latest)"
        }
    }
    catch {
        Add-Error "data\master\project.json is invalid JSON."
    }
}

# ---------------------------------
# v1.4 AI answer manifest
# ---------------------------------

$manifestPath = Require-File "data\master\holistix-ai-answer-manifest-v1.4.json"

if ($manifestPath) {
    try {
        $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json

        $current = $manifest.archive_and_provenance.current_archived_project_release
        $previous = $manifest.archive_and_provenance.previous_release

        if ($current.version -ne "1.4") {
            Add-Error "AI manifest current archived version is not 1.4."
        }

        if ($current.doi -ne "https://doi.org/10.5281/zenodo.21574706") {
            Add-Error "AI manifest current archived DOI is incorrect."
        }

        if ($previous.version -ne "1.3") {
            Add-Error "AI manifest previous release is not 1.3."
        }

        if ($previous.doi -ne "https://doi.org/10.5281/zenodo.21033668") {
            Add-Error "AI manifest previous release DOI is incorrect."
        }
    }
    catch {
        Add-Error "v1.4 AI answer manifest is invalid JSON."
    }
}

# ---------------------------------
# Required transparency files
# ---------------------------------

$requiredDocs = @(
    "README.md",
    "RELEASE_NOTES_v1.4.md",
    "LICENSE_DATA.txt",
    "VERSION_HISTORY.md",
    "KNOWN_LIMITATIONS.md",
    "METADATA_CORRECTION_2026-08-07.md"
)

foreach ($doc in $requiredDocs) {
    Require-File $doc | Out-Null
}

# ---------------------------------
# Detect stale current-release text
# Historical v1.3 references are allowed.
# ---------------------------------

$staleChecks = @(
    @{
        File = "VERSION_HISTORY.md"
        Text = "Current project trust-layer release: **v1.3**"
    },
    @{
        File = "VERSION_HISTORY.md"
        Text = "Current archived project release: **v1.3**"
    },
    @{
        File = "VERSION_HISTORY.md"
        Text = "Current version DOI for archived v1.3 release:"
    },
    @{
        File = "KNOWN_LIMITATIONS.md"
        Text = "Project release: v1.3"
    },
    @{
        File = "KNOWN_LIMITATIONS.md"
        Text = "Current archived release DOI for the v1.3 trust-layer release:"
    },
    @{
        File = "README.md"
        Text = "exact DOI for v1.4 should be added after"
    },
    @{
        File = "RELEASE_NOTES_v1.4.md"
        Text = "exact DOI for v1.4 will be assigned when"
    },
    @{
        File = "LICENSE_DATA.txt"
        Text = "License decision required before public v1.4 release"
    }
)

foreach ($check in $staleChecks) {
    $path = Join-Path $Root $check.File

    if (Test-Path $path) {
        $content = Get-Content $path -Raw

        if ($content.Contains($check.Text)) {
            Add-Error "Stale current-release metadata found in $($check.File): $($check.Text)"
        }
    }
}

# ---------------------------------
# Parse every repository JSON file
# Exclude .git only.
# ---------------------------------

$jsonErrors = @()

Get-ChildItem $Root -Recurse -File -Filter "*.json" |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]'
    } |
    ForEach-Object {
        $jsonFile = $_.FullName

        try {
            Get-Content $jsonFile -Raw | ConvertFrom-Json | Out-Null
        }
        catch {
            $jsonErrors += $jsonFile
        }
    }

foreach ($file in $jsonErrors) {
    Add-Error "JSON parse failure: $file"
}

# ---------------------------------
# Result
# ---------------------------------

if ($errors.Count -gt 0) {
    Write-Host ""
    Write-Host "PROJECT METADATA VALIDATION FAILED"
    Write-Host "----------------------------------"

    foreach ($errorMessage in $errors) {
        Write-Host "FAIL: $errorMessage"
    }

    Write-Host ""
    Write-Host "Errors:" $errors.Count
    exit 1
}

Write-Host ""
Write-Host "PROJECT METADATA VALIDATION PASSED"
Write-Host "----------------------------------"
Write-Host "Project version: 1.4"
Write-Host "Dataset version: 1.2"
Write-Host "Current DOI: 10.5281/zenodo.21574706"
Write-Host "Concept DOI: 10.5281/zenodo.20978709"
Write-Host "License: CC-BY-4.0"
Write-Host "Repository JSON parse errors: 0"
Write-Host ""
Write-Host "No metadata drift detected."

exit 0
