Describe 'Module Tests' {
    BeforeAll {
        $Module1Path = Join-Path $env:GITHUB_WORKSPACE "tests" "TestModule1" "TestModule1.psd1"
        $Module2Path = Join-Path $env:GITHUB_WORKSPACE "tests" "TestModule2" "TestModule2.psd1"
    }

    It 'version' {
        $Data = Test-ModuleManifest -Path $Module1Path

        $Data.Version.ToString() | Should -Be "1.1.1"
        $Data.PrivateData.PSData.Prerelease | Should -BeNullOrEmpty
    }
    It 'version with prerelease' {
        $Data = Test-ModuleManifest -Path $Module2Path

        $Data.Version.ToString() | Should -Be "1.1.1"
        $Data.PrivateData.PSData.Prerelease | Should -Be "alpha1"
    }
    It 'copyright static' {
        $Data = Test-ModuleManifest -Path $Module1Path

        $Data.Copyright | Should -Be "(c) 2001 John Doe. All rights reserved."
    }
    It 'copyright with YYYY' {
        $Data = Test-ModuleManifest -Path $Module2Path

        $CurrentYear = Get-Date -Format "yyyy"
        $Data.Copyright | Should -Be "(c) $CurrentYear John Doe. All rights reserved." 
    }
    It 'description' {
        $Data = Test-ModuleManifest -Path $Module1Path

        $Data.Description | Should -Be "This is a test module."
    }
    It 'releaseNotes' {
        $Data = Test-ModuleManifest -Path $Module1Path
        $Data.ReleaseNotes | Should -Be "Stuff changed."
    }
    It 'functionsToExport' {
        $Data = Test-ModuleManifest -Path $Module1Path

        $ExportedFunctionNames = @()
        foreach ($Key in $Data.ExportedFunctions.Keys) {
            $ExportedFunctionNames += $Key
        }
        $ExportedFunctionNames | Should -Be @("Test-Function1", "Test-Function2")
    }
    It 'functionsToExportPath' {
        $Data = Test-ModuleManifest -Path $Module2Path

        $ExportedFunctionNames = @()
        foreach ($Key in $Data.ExportedFunctions.Keys) {
            $ExportedFunctionNames += $Key
        }
        $ExportedFunctionNames | Should -Be @("Test-Function1", "Test-Function2")
    }
}