# Update PowerShell Metadata GitHub Action

[![PowerShell on Windows](https://gist.github.com/natescherer/fc69436698dbb94367e2409a64dc9a45/raw/3bce49a7d468384e6a20d92b0348642f0318324c/update-powershell-metadata-action_TestResults_Windows.md_badge.svg)](https://gist.github.com/natescherer/fc69436698dbb94367e2409a64dc9a45) [![PowerShell on Linux](https://gist.github.com/natescherer/da4b1387fee9b8d12bc42aa8638c73ba/raw/26199dbb6555fec3b93eb3a812a39c116d713ac9/update-powershell-metadata-action_TestResults_Linux.md_badge.svg)](https://gist.github.com/natescherer/da4b1387fee9b8d12bc42aa8638c73ba) [![PowerShell on macOS](https://gist.github.com/natescherer/5bd3302f98ead9f8314d55540cdd0862/raw/570b9a09ab12d5cb7ef3bdd19d398e666ecd5362/update-powershell-metadata-action_TestResults_macOS.md_badge.svg)](https://gist.github.com/natescherer/5bd3302f98ead9f8314d55540cdd0862)

<!--START_SECTION:description-->
A GitHub Action to update metadata in PowerShell module manifests and ScriptFileInfo in PowerShell scripts.
<!--END_SECTION:description-->

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
<!--(inputs-end)-->

### Outputs

This Action defines the following formal outputs.

<!--(outputs-start)-->
<!--(outputs-end)-->

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.
