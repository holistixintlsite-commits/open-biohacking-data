param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$sourceDir = Join-Path $Root "data\datasets\v1.2"
$outputDir = Join-Path $Root "data\jsonl\v1.2"

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$jsonFiles = Get-ChildItem "$sourceDir\*.json" | Sort-Object Name

$totalRecords = 0
$fileCount = 0

foreach ($file in $jsonFiles) {

    $data = Get-Content $file.FullName -Raw | ConvertFrom-Json

    if ($data -is [System.Array]) {
        $records = @($data)
    }
    elseif ($null -ne $data.records) {
        $records = @($data.records)
    }
    else {
        throw "No record array found in $($file.Name)"
    }

    $outputName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".jsonl"
    $outputPath = Join-Path $outputDir $outputName

    $lines = foreach ($record in $records) {
        $record | ConvertTo-Json -Depth 100 -Compress
    }

    $text = if ($lines.Count -gt 0) {
        ($lines -join "`n") + "`n"
    }
    else {
        ""
    }

    [System.IO.File]::WriteAllText(
        $outputPath,
        $text,
        [System.Text.UTF8Encoding]::new($false)
    )

    $fileCount++
    $totalRecords += $records.Count

    Write-Host "$outputName -> $($records.Count) records"
}

Write-Host ""
Write-Host "JSONL GENERATION PASSED"
Write-Host "-----------------------"
Write-Host "Files:" $fileCount
Write-Host "Total records:" $totalRecords
Write-Host "Output:" $outputDir
