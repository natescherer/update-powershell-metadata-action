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

# Ensuring Microsoft.PowerShell.PSResourceGet is installed
$PSResourceGetMetadata = Get-Module -ListAvailable -Name Microsoft.PowerShell.PSResourceGet
if (!$PSResourceGetMetadata) {
    Write-Host -Object "'Microsoft.PowerShell.PSResourceGet' is not installed, now installing..."
    Install-Module -Name Microsoft.PowerShell.PSResourceGet -RequiredVersion $PsrgPinnedVer -Force -AllowPrerelease
}
elseif ($PSResourceGetMetadata.Version -gt $PsrgPinnedVerShort) {
    Write-Warning -Message "'Microsoft.PowerShell.PSResourceGet' is higher than the pinned version of '$PsrgPinnedVer'. This may cause unexpected results. Consider opening a GitHub issue at 'https://github.com/natescherer/publish-powershell-action/issues' regarding this."
}
elseif ($PSResourceGetMetadata.Version -lt $PsrgPinnedVerShort) {
    Write-Host "'Microsoft.PowerShell.PSResourceGet' is less than the pinned version of '$PsrgPinnedVer'. Now updating..."
    Install-Module -Name Microsoft.PowerShell.PSResourceGet -RequiredVersion $PsrgPinnedVer -Force -AllowPrerelease
}
elseif ($PSResourceGetMetadata.Version -eq $PsrgPinnedVerShort) {
    Write-Host "'Microsoft.PowerShell.PSResourceGet' is already at pinned version of '$PsrgPinnedVer'."
}
else {
    throw "Something went wrong while ensuring 'Microsoft.PowerShell.PSResourceGet' is installed. Consider opening a GitHub issue at 'https://github.com/natescherer/publish-powershell-action/issues' regarding this."
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