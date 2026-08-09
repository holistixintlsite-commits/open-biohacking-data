param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [string]$ProjectVersion = "1.5.0",
    [string]$DatasetVersion = "1.2"
)

$ErrorActionPreference = "Stop"

$datasetDir = Join-Path $Root "data\datasets\v1.2"
$masterDir = Join-Path $Root "data\master"
$productTwinDir = Join-Path $Root "data\product-twins"
$schemaDir = Join-Path $Root "schemas"
$methodologyDir = Join-Path $Root "methodology"

$datapackagePath = Join-Path $Root "datapackage.json"
$dataDictionaryPath = Join-Path $Root "DATA_DICTIONARY.md"

$resources = @()
$schemaMap = @{}

# --------------------------------------------------
# Build tabular schemas from canonical CSV datasets.
# --------------------------------------------------

$csvFiles = Get-ChildItem $datasetDir -File -Filter "*.csv" |
    Sort-Object Name

foreach ($file in $csvFiles) {

    $rows = Import-Csv $file.FullName

    if ($rows.Count -eq 0) {
        throw "CSV contains no data rows: $($file.Name)"
    }

    $headers = $rows[0].PSObject.Properties.Name

    $fields = foreach ($header in $headers) {

        $values = $rows |
            ForEach-Object { $_.$header } |
            Where-Object { $_ -ne $null -and $_ -ne "" }

        $type = "string"

        if ($values.Count -gt 0) {

            $allBoolean = $true
            $allInteger = $true
            $allNumber = $true

            foreach ($value in $values) {

                $tmpBool = $false
                $tmpInt = 0
                $tmpDouble = 0.0

                if (-not [bool]::TryParse($value, [ref]$tmpBool)) {
                    $allBoolean = $false
                }

                if (-not [int]::TryParse($value, [ref]$tmpInt)) {
                    $allInteger = $false
                }

                if (-not [double]::TryParse(
                    $value,
                    [System.Globalization.NumberStyles]::Any,
                    [System.Globalization.CultureInfo]::InvariantCulture,
                    [ref]$tmpDouble
                )) {
                    $allNumber = $false
                }
            }

            if ($allBoolean) {
                $type = "boolean"
            }
            elseif ($allInteger) {
                $type = "integer"
            }
            elseif ($allNumber) {
                $type = "number"
            }
        }

        [ordered]@{
            name = $header
            type = $type
        }
    }

    $datasetName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    $schemaMap[$datasetName] = [ordered]@{
        fields = @($fields)
    }
}

# --------------------------------------------------
# Canonical subject datasets.
# --------------------------------------------------

Get-ChildItem $datasetDir -File |
    Sort-Object Name |
    ForEach-Object {

        $ext = $_.Extension.ToLower()
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\","/")
        $sha256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()

        if ($ext -eq ".csv") {

            $resources += [ordered]@{
                name = "$baseName-csv"
                type = "table"
                path = $relative
                format = "csv"
                mediatype = "text/csv"
                encoding = "utf-8"
                bytes = $_.Length
                hash = "sha256:$sha256"
                role = "canonical-subject-dataset"
                dataset_version = $DatasetVersion
                canonical = $true
                schema = $schemaMap[$baseName]
            }
        }

        elseif ($ext -eq ".json") {

            $resources += [ordered]@{
                name = "$baseName-json"
                type = "file"
                path = $relative
                format = "json"
                mediatype = "application/json"
                encoding = "utf-8"
                bytes = $_.Length
                hash = "sha256:$sha256"
                role = "canonical-subject-dataset"
                dataset_version = $DatasetVersion
                canonical = $true
            }
        }
    }

# --------------------------------------------------
# Master registries and AI infrastructure.
# --------------------------------------------------

Get-ChildItem $masterDir -File |
    Sort-Object Name |
    ForEach-Object {

        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\","/")
        $sha256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()

        $resources += [ordered]@{
            name = "$baseName-json"
            type = "file"
            path = $relative
            format = "json"
            mediatype = "application/json"
            encoding = "utf-8"
            bytes = $_.Length
            hash = "sha256:$sha256"
            role = "registry-or-ai-infrastructure"
            canonical = $true
        }
    }

# --------------------------------------------------
# Product digital twins.
# --------------------------------------------------

Get-ChildItem $productTwinDir -File |
    Sort-Object Name |
    ForEach-Object {

        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\","/")
        $sha256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()

        $resources += [ordered]@{
            name = "product-twin-$baseName-json"
            type = "file"
            path = $relative
            format = "json"
            mediatype = "application/json"
            encoding = "utf-8"
            bytes = $_.Length
            hash = "sha256:$sha256"
            role = "product-digital-twin"
            canonical = $true
        }
    }

# --------------------------------------------------
# JSON Schemas.
# --------------------------------------------------

Get-ChildItem $schemaDir -File |
    Sort-Object Name |
    ForEach-Object {

        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\","/")
        $sha256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()

        $resources += [ordered]@{
            name = "schema-$baseName-json"
            type = "file"
            path = $relative
            format = "json"
            mediatype = "application/schema+json"
            encoding = "utf-8"
            bytes = $_.Length
            hash = "sha256:$sha256"
            role = "json-schema"
            canonical = $true
        }
    }

# --------------------------------------------------
# Methodology documents.
# --------------------------------------------------

Get-ChildItem $methodologyDir -File |
    Sort-Object Name |
    ForEach-Object {

        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\","/")
        $sha256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()

        $resources += [ordered]@{
            name = "methodology-$baseName-md"
            type = "file"
            path = $relative
            format = "md"
            mediatype = "text/markdown"
            encoding = "utf-8"
            bytes = $_.Length
            hash = "sha256:$sha256"
            role = "methodology-documentation"
            canonical = $true
        }
    }

# --------------------------------------------------
# Data Package.
# --------------------------------------------------

$package = [ordered]@{
    '$schema' = "https://datapackage.org/profiles/2.0/datapackage.json"
    profile = "data-package"
    name = "holistix-open-biohacking-data"
    title = "Holistix Open Biohacking Data Project"
    description = "Open structured reference data for wellness technologies, product specifications, safety information, evidence metadata, claim boundaries, provenance, and machine-readable product intelligence."
    version = $ProjectVersion
    dataset_version = $DatasetVersion
    release_status = "published"
    id = "https://doi.org/10.5281/zenodo.20978709"
    homepage = "https://www.holistixintl.com/pages/open-biohacking-data-index"
    repository = "https://github.com/holistixintlsite-commits/open-biohacking-data"

    licenses = @(
        [ordered]@{
            name = "CC-BY-4.0"
            title = "Creative Commons Attribution 4.0 International"
            path = "https://creativecommons.org/licenses/by/4.0/"
        }
    )

    identifiers = [ordered]@{
        concept_doi = "10.5281/zenodo.20978709"
        release_doi = "10.5281/zenodo.21862535"
        previous_release_doi = "10.5281/zenodo.21574706"
    }

    versioning = [ordered]@{
        project_release = $ProjectVersion
        canonical_subject_dataset_release = $DatasetVersion
        previous_project_release = "1.4"
        previous_project_release_doi = "10.5281/zenodo.21574706"
        versioning_rule = "Project release versions and subject dataset versions are independently managed. A project release does not automatically increment unchanged subject datasets."
    }

    provenance = [ordered]@{
        generated = $true
        generator = "build/generate_interoperability.ps1"
        canonical_metadata = "project_metadata.json"
        methodology = "methodology/data-methodology.md"
        version_history = "VERSION_HISTORY.md"
        known_limitations = "KNOWN_LIMITATIONS.md"
    }

    resource_count = $resources.Count
    resources = @($resources)
}

$package |
    ConvertTo-Json -Depth 100 |
    Set-Content $datapackagePath -Encoding utf8

# --------------------------------------------------
# Human-readable data dictionary.
# --------------------------------------------------

$csvResources = $package.resources |
    Where-Object format -eq "csv" |
    Sort-Object name

$lines = [System.Collections.Generic.List[string]]::new()

$lines.Add("# Holistix Open Biohacking Data Dictionary")
$lines.Add("")
$lines.Add("Project release: **v$ProjectVersion**")
$lines.Add("")
$lines.Add("Canonical subject dataset release: **v$DatasetVersion**")
$lines.Add("")
$lines.Add("Release status: **published**")
$lines.Add("")
$lines.Add("This document is generated from the tabular schemas embedded in datapackage.json.")
$lines.Add("")
$lines.Add("> This dictionary documents structure and representation. It does not establish scientific validation, medical evidence, product endorsement, or clinical efficacy.")
$lines.Add("")
$lines.Add("## Schema Principles")
$lines.Add("")
$lines.Add("- Dataset structure is derived from the canonical v$DatasetVersion CSV files.")
$lines.Add("- Field types describe current machine-readable representation.")
$lines.Add("- Project and subject dataset versions are independently managed.")
$lines.Add("- Row-level citation fields preserve source attribution and citation context.")
$lines.Add("- Dataset-specific structural differences are preserved.")
$lines.Add("")

foreach ($resource in $csvResources) {

    $title = $resource.name -replace '-v1\.2-csv$','' -replace '-',' '
    $title = (Get-Culture).TextInfo.ToTitleCase($title)

    $lines.Add("## $title")
    $lines.Add("")
    $lines.Add("Resource name: $($resource.name)")
    $lines.Add("")
    $lines.Add("Path: $($resource.path)")
    $lines.Add("")
    $lines.Add("Dataset version: $($resource.dataset_version)")
    $lines.Add("")
    $lines.Add("Field count: $($resource.schema.fields.Count)")
    $lines.Add("")
    $lines.Add("| Field | Type |")
    $lines.Add("|---|---|")

    foreach ($field in $resource.schema.fields) {
        $lines.Add("| $($field.name) | $($field.type) |")
    }

    $lines.Add("")
}

$allFields = $csvResources |
    ForEach-Object { $_.schema.fields.name } |
    Sort-Object -Unique

$lines.Add("## Cross-Dataset Field Matrix")
$lines.Add("")
$lines.Add("This matrix shows which fields occur in each canonical subject dataset.")
$lines.Add("")

$shortNames = foreach ($resource in $csvResources) {
    $resource.name `
        -replace '-reference-index-v1\.2-csv$','' `
        -replace '-database-v1\.2-csv$','' `
        -replace '-index-v1\.2-csv$',''
}

$header = "| Field | " + ($shortNames -join " | ") + " |"
$separator = "|---|" + (($shortNames | ForEach-Object { "---" }) -join "|") + "|"

$lines.Add($header)
$lines.Add($separator)

foreach ($fieldName in $allFields) {

    $cells = foreach ($resource in $csvResources) {

        if ($resource.schema.fields.name -contains $fieldName) {
            "YES"
        }
        else {
            ""
        }
    }

    $lines.Add("| $fieldName | " + ($cells -join " | ") + " |")
}

$lines.Add("")
$lines.Add("## Citation Fields")
$lines.Add("")
$lines.Add("- source_name: human-readable source identification.")
$lines.Add("- source_url: source location or reference URL.")
$lines.Add("- citation_note: row-specific citation or interpretation context.")
$lines.Add("")
$lines.Add("These fields improve traceability but do not by themselves establish evidence quality, scientific validity, or claim substantiation.")
$lines.Add("")
$lines.Add("## Machine-Readable Source")
$lines.Add("")
$lines.Add("Authoritative interoperability representation: datapackage.json")
$lines.Add("")
$lines.Add("Generator: build/generate_interoperability.ps1")
$lines.Add("")
$lines.Add("Concept DOI: 10.5281/zenodo.20978709")

$dictionaryText = ($lines -join "`r`n").TrimEnd("`r","`n") + "`r`n"
Set-Content $dataDictionaryPath $dictionaryText -Encoding utf8 -NoNewline

Write-Host ""
Write-Host "INTEROPERABILITY GENERATION PASSED"
Write-Host "----------------------------------"
Write-Host "Project version:" $ProjectVersion
Write-Host "Dataset version:" $DatasetVersion
Write-Host "Resources:" $resources.Count
Write-Host "CSV schemas:" $csvResources.Count
Write-Host "Data Package:" $datapackagePath
Write-Host "Data Dictionary:" $dataDictionaryPath
