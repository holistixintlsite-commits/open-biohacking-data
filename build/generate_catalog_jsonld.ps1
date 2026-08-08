param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$datapackagePath = Join-Path $Root "datapackage.json"
$outputPath = Join-Path $Root "catalog.jsonld"

if (-not (Test-Path $datapackagePath)) {
    throw "datapackage.json not found: $datapackagePath"
}

$package = Get-Content $datapackagePath -Raw | ConvertFrom-Json

$canonicalResources = @(
    $package.resources |
        Where-Object { $_.role -eq "canonical-subject-dataset" } |
        Sort-Object name
)

$groups = $canonicalResources |
    Group-Object {
        $_.name `
            -replace '-csv$','' `
            -replace '-json$',''
    } |
    Sort-Object Name

$datasets = foreach ($group in $groups) {

    $first = $group.Group | Select-Object -First 1

    $datasetName = $group.Name `
        -replace '-v1\.2$','' `
        -replace '-',' '

    $datasetTitle = [System.Globalization.CultureInfo]::InvariantCulture.TextInfo.ToTitleCase($datasetName)

$datasetSlug = $group.Name -replace '-v1\.2$',''
$datasetUrl = "https://www.holistixintl.com/pages/$datasetSlug"

    $distributions = foreach ($resource in ($group.Group | Sort-Object name)) {

        $rawUrl = "https://raw.githubusercontent.com/holistixintlsite-commits/open-biohacking-data/main/$($resource.path)"

        [ordered]@{
            "@type" = "DataDownload"
            name = $resource.name
            encodingFormat = $resource.mediatype
            contentUrl = $rawUrl
            contentSize = "$($resource.bytes) bytes"
            sha256 = ($resource.hash -replace '^sha256:','')
        }
    }

    $jsonlPath = "data/jsonl/v1.2/$($group.Name).jsonl"
    $jsonlFullPath = Join-Path $Root ($jsonlPath -replace '/','\')

    if (-not (Test-Path $jsonlFullPath)) {
        throw "Missing JSONL distribution: $jsonlPath"
    }

    $jsonlRawUrl = "https://raw.githubusercontent.com/holistixintlsite-commits/open-biohacking-data/main/$jsonlPath"

    $jsonlText = Get-Content $jsonlFullPath -Raw
    $jsonlNormalized = $jsonlText -replace "`r`n", "`n" -replace "`r", "`n"
    $jsonlBytes = [System.Text.UTF8Encoding]::new($false).GetBytes($jsonlNormalized)

    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $jsonlHash = ([System.BitConverter]::ToString($sha.ComputeHash($jsonlBytes))).Replace("-","").ToLowerInvariant()
    }
    finally {
        $sha.Dispose()
    }

    $distributions += [ordered]@{
        "@type" = "DataDownload"
        name = "$($group.Name)-jsonl"
        encodingFormat = "application/jsonl"
        contentUrl = $jsonlRawUrl
        contentSize = "$($jsonlBytes.Length) bytes"
        sha256 = $jsonlHash
    }

    [ordered]@{
        "@type" = "Dataset"
        "@id" = $datasetUrl
        url = $datasetUrl
        name = $datasetTitle
        identifier = $group.Name
        version = $first.dataset_version
        isPartOf = [ordered]@{
            "@id" = "https://doi.org/10.5281/zenodo.20978709"
        }
        license = "https://creativecommons.org/licenses/by/4.0/"
        distribution = @($distributions)
    }
}

$catalog = [ordered]@{
    "@context" = "https://schema.org"
    "@type" = "DataCatalog"
    "@id" = "https://doi.org/10.5281/zenodo.20978709"
    name = "Holistix Open Biohacking Data Project"
    description = "Open structured reference data for wellness technologies, product specifications, safety information, evidence metadata, claim boundaries, provenance, and machine-readable product intelligence."
    url = "https://www.holistixintl.com/pages/open-biohacking-data-index"
    version = $package.version
    license = "https://creativecommons.org/licenses/by/4.0/"
    codeRepository = "https://github.com/holistixintlsite-commits/open-biohacking-data"
    dataset = @($datasets)
}

$catalog |
    ConvertTo-Json -Depth 100 |
    Set-Content $outputPath -Encoding utf8

Write-Host ""
Write-Host "JSON-LD CATALOG GENERATION PASSED"
Write-Host "---------------------------------"
Write-Host "Project version:" $package.version
Write-Host "Canonical datasets:" $datasets.Count
Write-Host "Catalog:" $outputPath
