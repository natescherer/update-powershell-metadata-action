Write-Host "Starting Action..."

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

Write-Host "Installing PowerShellGet 3..."
# Ensuring PowerShellGet stable is latest version
Install-Module -Name PowerShellGet -Force -AllowClobber
# Installing PowerShellGet 3 Prerelease
## Pinning to specific version of PowerShellGet until stable v3 is released
## This is Preview 16 to limit bad interaction with publish-powershell-action
Install-Module -Name PowerShellGet -RequiredVersion 3.0.16-beta16 -AllowPrerelease -Force