param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$datapackagePath = Join-Path $Root "datapackage.json"
$outputPath = Join-Path $Root "ro-crate-metadata.json"

if (-not (Test-Path $datapackagePath)) {
    throw "datapackage.json not found: $datapackagePath"
}

$package = Get-Content $datapackagePath -Raw | ConvertFrom-Json

$graph = [System.Collections.Generic.List[object]]::new()

# RO-Crate Metadata File Descriptor
$graph.Add(
    [ordered]@{
        "@id" = "ro-crate-metadata.json"
        "@type" = "CreativeWork"
        about = [ordered]@{
            "@id" = "./"
        }
        conformsTo = [ordered]@{
            "@id" = "https://w3id.org/ro/crate/1.2"
        }
    }
)

# Build hasPart references from datapackage resources
$hasPart = @(
    $package.resources |
        Sort-Object path |
        ForEach-Object {
            [ordered]@{
                "@id" = $_.path
            }
        }
)

# Root Data Entity
$graph.Add(
    [ordered]@{
        "@id" = "./"
        "@type" = "Dataset"
        name = $package.title
        description = $package.description
        version = $package.version
        identifier = $package.id
        url = $package.homepage
        datePublished = "2026-08-09"
        license = [ordered]@{
            "@id" = "https://creativecommons.org/licenses/by/4.0/"
        }
        codeRepository = $package.repository
        hasPart = $hasPart
    }
)

# File / Dataset entities
foreach ($resource in ($package.resources | Sort-Object path)) {

    $types = @("File")

    if ($resource.role -eq "canonical-subject-dataset") {
        $types += "Dataset"
    }

    $entity = [ordered]@{
        "@id" = $resource.path
        "@type" = $types
        name = $resource.name
        encodingFormat = $resource.mediatype
        contentSize = "$($resource.bytes) bytes"
        sha256 = ($resource.hash -replace '^sha256:','')
        isPartOf = [ordered]@{
            "@id" = "./"
        }
    }

    if ($resource.dataset_version) {
        $entity.version = $resource.dataset_version
    }

    $graph.Add($entity)
}

# Complete RO-Crate document
$crate = [ordered]@{
    "@context" = "https://w3id.org/ro/crate/1.2/context"
    "@graph" = @($graph)
}

$crate |
    ConvertTo-Json -Depth 100 |
    Set-Content $outputPath -Encoding utf8

Write-Host ""
Write-Host "RO-CRATE GENERATION PASSED"
Write-Host "--------------------------"
Write-Host "RO-Crate specification: 1.2"
Write-Host "Project version:" $package.version
Write-Host "Date published: 2026-08-09"
Write-Host "Resources:" $package.resources.Count
Write-Host "Graph entities:" $graph.Count
Write-Host "RO-Crate:" $outputPath