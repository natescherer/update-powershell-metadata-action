Write-Host "Validating Inputs..."

if ($env:INPUT_FUNCTIONSTOEXPORT -and $env:INPUT_FUNCTIONSTOEXPORTPATH) {
    Write-Host "You cannot use both 'functionsToExport' and 'functionsToExportPath' at the same time."
    throw "Input validation error."
}

if (($env:RESOLVEDPATH -like "*.ps1") -and ($env:INPUT_FUNCTIONSTOEXPORT -or $env:INPUT_FUNCTIONSTOEXPORTPATH)) {
    throw "Cannot use 'functionsToExport' or 'functionsToExportPath' input for a script."
}