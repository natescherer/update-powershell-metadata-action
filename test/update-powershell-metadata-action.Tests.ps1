Describe 'Module Tests' {
    It 'version' {
        $Data = Test-ModuleManifest -Path test\TestModule1\TestModule1.psd1

        $Data.Version.ToString() | Should -Be "1.1.1"
        $Data.PrivateData.PSData.Prerelease | Should -BeNullOrEmpty
    }
    It 'version with prerelease' {
        $Data = Test-ModuleManifest -Path test\TestModule2\TestModule2.psd1

        $Data.Version.ToString() | Should -Be "1.1.1"
        $Data.PrivateData.PSData.Prerelease | Should -Be "alpha1"
    }
    It 'copyright static' {
        $Data = Test-ModuleManifest -Path test\TestModule1\TestModule1.psd1

        $Data.Copyright | Should -Be "(c) 2001 John Doe. All rights reserved."
    }
    It 'copyright with YYYY' {
        $Data = Test-ModuleManifest -Path test\TestModule2\TestModule2.psd1

        $CurrentYear = Get-Date -Format "yyyy"
        $Data.Copyright | Should -Be "(c) $CurrentYear John Doe. All rights reserved." 
    }
    It 'description' {
        $Data = Test-ModuleManifest -Path test\TestModule1\TestModule1.psd1

        $Data.Description | Should -Be "This is a test module."
    }
    It 'releaseNotes' {
        $Data = Test-ModuleManifest -Path test\TestModule1\TestModule1.psd1

        $Data.ReleaseNotes | Should -Be "Stuff changed."
    }
    It 'functionsToExport' {
        $Data = Test-ModuleManifest -Path test\TestModule1\TestModule1.psd1

        $ExportedFunctionNames = @()
        foreach ($Key in $Data.ExportedFunctions.Keys) {
            $ExportedFunctionNames += $Key
        }
        $ExportedFunctionNames | Should -Be @("Test-Function1","Test-Function2")
    }
    It 'functionsToExportPath' {
        $Data = Test-ModuleManifest -Path test\TestModule2\TestModule2.psd1

        $ExportedFunctionNames = @()
        foreach ($Key in $Data.ExportedFunctions.Keys) {
            $ExportedFunctionNames += $Key
        }
        $ExportedFunctionNames | Should -Be @("Test-Function1", "Test-Function2")
    }
}

Describe 'Script Tests' {
    It 'version' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script1\Test-Script1.ps1

        $Data.Version | Should -Be "1.1.1"
    }
    It 'version with prerelease' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script2\Test-Script2.ps1

        $Data.Version | Should -Be "1.1.1-alpha1"
    }
    It 'copyright static' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script1\Test-Script1.ps1

        $Data.Copyright | Should -Be "(c) 2001 John Doe. All rights reserved."
    }
    It 'copyright with YYYY' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script2\Test-Script2.ps1

        $CurrentYear = Get-Date -Format "yyyy"
        $Data.Copyright | Should -Be "(c) $CurrentYear John Doe. All rights reserved." 
    }
    It 'description' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script1\Test-Script1.ps1

        $Data.Description | Should -Be "This is a test script."
    }
    It 'releaseNotes' {
        $Data = Test-ScriptFileInfo -Path test\Test-Script1\Test-Script1.ps1

        $Data.ReleaseNotes | Should -Be "Stuff changed."
    }
}