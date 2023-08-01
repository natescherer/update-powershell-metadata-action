Write-Host "Building metadata object..."

$MetadataSplat = @{ Path = $env:RESOLVEDPATH}

if ($env:INPUT_VERSION) {
    if ($env:RESOLVEDPATH -like "*.psd1") {
        if ($env:INPUT_VERSION -like "*-*") {
            $MetadataSplat += @{ 
                ModuleVersion = ($env:INPUT_VERSION -split "-",2)[0]
                Prerelease = ($env:INPUT_VERSION -split "-",2)[1]
            }
        } else {
            $MetadataSplat += @{ ModuleVersion = $env:INPUT_VERSION }
        }
    } else {
        $MetadataSplat += @{ Version = $env:INPUT_VERSION }
    }
}

if ($env:INPUT_COPYRIGHT) {
    if ($env:INPUT_COPYRIGHT -clike "*YYYY*") {
        $CurrentYear = Get-Date -Format "yyyy"
        $env:INPUT_COPYRIGHT = $env:INPUT_COPYRIGHT -replace "YYYY", $CurrentYear
    }
    $MetadataSplat += @{ Copyright = $env:INPUT_COPYRIGHT }
}

if ($env:INPUT_DESCRIPTION) {
    $MetadataSplat += @{ Description = $env:INPUT_DESCRIPTION }
}

if ($env:INPUT_RELEASENOTES) {
    $MetadataSplat += @{ ReleaseNotes = $env:INPUT_RELEASENOTES}
}

if ($env:INPUT_FUNCTIONSTOEXPORT) {
    $FunctionsArray = $env:INPUT_FUNCTIONSTOEXPORT.split(",")
    $MetadataSplat += @{ FunctionsToExport = $FunctionsArray}
}

if ($env:INPUT_FUNCTIONSTOEXPORTPATH) {
    $FunctionFiles = Get-ChildItem -Path $env:INPUT_FUNCTIONSTOEXPORTPATH -Include "*.ps1" -Recurse
    $FunctionsToExport = @()
    foreach ($File in $FunctionFiles) {
        $FunctionsToExport += [io.path]::GetFileNameWithoutExtension($File.FullName)
    }
    $MetadataSplat += @{ FunctionsToExport = $FunctionsToExport}
}

if ($env:RESOLVEDPATH -like "*.psd1") {
    Write-Host "Updating module metadata..."

    Update-PSModuleManifest @MetadataSplat
} else {
    Write-Host "Updating ScriptFileInfo..."

    Update-PSScriptFileInfo @MetadataSplat
}

Write-Host "Done!"