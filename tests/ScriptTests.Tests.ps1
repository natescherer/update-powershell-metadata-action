Describe 'Script Tests' {
    BeforeAll {
        $Script1Path = Join-Path $env:GITHUB_WORKSPACE "tests" "Test-Script1" "Test-Script1.ps1"
        $Script2Path = Join-Path $env:GITHUB_WORKSPACE "tests" "Test-Script2" "Test-Script2.ps1"
    }

    It 'version' {
        $Data = Get-PSScriptFileInfo -Path $Script1Path

        $Data.ScriptMetadataComment.Version | Should -Be "1.1.1"
    }
    It 'version with prerelease' {
        $Data = Get-PSScriptFileInfo -Path $Script2Path

        $Data.ScriptMetadataComment.Version | Should -Be "1.1.1-alpha1"
    }
    It 'copyright static' {
        $Data = Get-PSScriptFileInfo -Path $Script1Path

        $Data.ScriptMetadataComment.Copyright | Should -Be "(c) 2001 John Doe. All rights reserved."
    }
    It 'copyright with YYYY' {
        $Data = Get-PSScriptFileInfo -Path $Script2Path

        $CurrentYear = Get-Date -Format "yyyy"
        $Data.ScriptMetadataComment.Copyright | Should -Be "(c) $CurrentYear John Doe. All rights reserved." 
    }
    It 'description' {
        $Data = Get-PSScriptFileInfo -Path $Script1Path

        $Data.ScriptHelpComment.Description | Should -Be "This is a test script."
    }
    It 'releaseNotes' {
        $Data = Get-PSScriptFileInfo -Path $Script1Path

        $Data.ScriptMetadataComment.ReleaseNotes | Should -Be "Stuff changed."
    }
}