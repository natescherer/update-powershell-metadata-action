Write-Host "Starting Action..."

$PsrgPinnedVerShort = "0.5.23"
$PsrgPinnedVer = "0.5.23-beta23"

Write-Host -Object "Ensuring PowerShellGet 2.2.5 is installed..."
# Ensuring PowerShellGet stable is at least version 2.2.5
$PowerShellGetMetadata = Get-Module -Name PowerShellGet
if ($PowerShellGetMetadata.Version -ge "2.2.5") {
    Write-Host -Object "Updating PowerShellGet to 2.2.5..."
    Install-Module -Name PowerShellGet -Force -AllowClobber
}
else {
    Write-Host -Object "PowerShellGet is up-to-date."
}

$FullPath = Join-Path $env:GITHUB_WORKSPACE $env:INPUT_PATH

if (Test-Path -Path $FullPath -PathType Container) {
    Write-Host "Input 'path' is a directory."

    $FindPowerShellFilesPath = Join-Path $env:GITHUB_ACTION_PATH src private Find-PowerShellFiles.ps1
    . $FindPowerShellFilesPath
    $ResolvedPath = Find-PowerShellFiles -Path $FullPath
} else {
    Write-Host "Input 'path' is a file."
    $ResolvedPath = $FullPath
}

Write-Host "Path resolved to: $ResolvedPath"
"RESOLVEDPATH=$ResolvedPath" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf-8 -Append
"path=$ResolvedPath" | Out-File -FilePath $env:GITHUB_OUTPUT -Encoding utf-8 -Append