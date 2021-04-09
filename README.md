# Update PowerShell Metadata GitHub Action

A GitHub Action to update the metadata in a PowerShell module manifest or ScriptFileInfo in a PowerShell script.

This action is designed to let you quickly update the release-related metadata in a manifest or script file as part of a release workflow.

It is tested and runs on `windows-latest`, `ubuntu-latest`, and `macos-latest`.

## Usage

```yaml
jobs:
  Publish:
    runs-on: windows-latest
    steps:
      - name: Update Metadata
        uses: natescherer/update-powershell-metadata-action@v1.0.0
        with:
          paths: src\MyModule.psd1
          version: 1.2.3-alpha1
          copyright: (c) YYYY Omni Consumer Products. All rights reserved.
```

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`path`** | true | Path to relative to the root of the project. Can either be a .psd1 file, a .ps1 file, or a directory. If a directory, the action will search for a .psd1 file in the root. If none are found, it will then search for a .ps1 file in the root
| **`version`** | false | A SemVer 1.0.0 compatible version number (must be SermVer 1.0.0 due to PowerShellGet's limitations). Supports prerelease versions such as 1.0.0-alpha.
| **`copyright`** | false | Copyright information. Include YYYY and it will automatically be replaced by the current year.
| **`description`** | false | Description of the module/script.
| **`releasenotes`** | false | Release notes for the module/script.
| **`functionstoexport`** | false | A comma-separated list of functions that should be exported from a module. Does not apply to scripts.
| **`functionstoexportpath`** | false | An alternate input instead of `functionstoexport` that will scan a directory for .ps1 files and export functions matching those file names. Useful if your module design uses dot-sourcing.

### Outputs

This Action defines the following formal outputs.

| Name | Description
|-|-|
| **`path`** | The fully-qualified path of the file that was modified by this action.

## Authors

**Nate Scherer** - *Initial work* - [natescherer](https://github.com/natescherer)

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.
