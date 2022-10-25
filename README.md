# Update PowerShell Metadata GitHub Action

[![PowerShell on Windows](https://gist.github.com/natescherer/fc69436698dbb94367e2409a64dc9a45/raw/3bce49a7d468384e6a20d92b0348642f0318324c/update-powershell-metadata-action_TestResults_Windows.md_badge.svg)](https://gist.github.com/natescherer/fc69436698dbb94367e2409a64dc9a45) [![PowerShell on Linux](https://gist.github.com/natescherer/da4b1387fee9b8d12bc42aa8638c73ba/raw/26199dbb6555fec3b93eb3a812a39c116d713ac9/update-powershell-metadata-action_TestResults_Linux.md_badge.svg)](https://gist.github.com/natescherer/da4b1387fee9b8d12bc42aa8638c73ba) [![PowerShell on macOS](https://gist.github.com/natescherer/5bd3302f98ead9f8314d55540cdd0862/raw/570b9a09ab12d5cb7ef3bdd19d398e666ecd5362/update-powershell-metadata-action_TestResults_macOS.md_badge.svg)](https://gist.github.com/natescherer/5bd3302f98ead9f8314d55540cdd0862)
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

A GitHub Action to update metadata in PowerShell modules and scripts.

This action is designed to let you quickly update the release-related metadata in a manifest or script file as part of a release workflow.

It is tested and runs on `windows-latest`, `ubuntu-latest`, and `macos-latest`.

## Usage

```yaml
    steps:
      - name: Update Metadata
        uses: natescherer/update-powershell-metadata-action@v2.0.0
        with:
          path: src\MyModule.psd1
          version: 1.2.3-alpha1
          copyright: (c) YYYY Omni Consumer Products. All rights reserved.
```

### Inputs

This Action defines the following formal inputs.

<!--(inputs-start)-->

| Name  | Required | Default | Description |
| :---: | :------: | :-----: | ----------- |
| `path` | true |  | Path to relative to the root of the project. Can either be a .psd1 file, a .ps1 file, or a directory. If a directory, the action will search for a .psd1 file in the root. If none are found, it will then search for a .ps1 file in the root. |
| `version` | false |  | A SemVer 1.0.0 compatible version number (must be SermVer 1.0.0 due to PowerShellGet's limitations). Supports prerelease versions such as 1.0.0-alpha. |
| `copyright` | false |  | Copyright information. Include YYYY and it will automatically be replaced by the current year. |
| `description` | false |  | Description of the module/script. |
| `releaseNotes` | false |  | Release notes for the module/script. |
| `functionsToExport` | false |  | A comma-separated list of functions that should be exported from a module. Does not apply to scripts. |
| `functionsToExportPath` | false |  | An alternate input instead of `functionsToExport` that will scan a directory for .ps1 files and export functions matching those file names. Useful if your module design uses dot-sourcing. |

<!--(inputs-end)-->

### Outputs

This Action defines the following formal outputs.

<!--(outputs-start)-->

| Name  | Description |
| :---: | ----------- |
| `path` | The fully-qualified path of the file that was modified by this action. |

<!--(outputs-end)-->

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://www.linkedin.com/in/natescherer01/"><img src="https://avatars.githubusercontent.com/u/376408?v=4?s=100" width="100px;" alt="Nate Scherer"/><br /><sub><b>Nate Scherer</b></sub></a><br /><a href="https://github.com/natescherer/update-powershell-metadata-action/commits?author=natescherer" title="Code">💻</a> <a href="https://github.com/natescherer/update-powershell-metadata-action/commits?author=natescherer" title="Documentation">📖</a> <a href="#infra-natescherer" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://allcontributors.org) specification.
Contributions of any kind are welcome!

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.
