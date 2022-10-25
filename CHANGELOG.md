# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.1] - 2022-10-25
### Changed
- Pinning to PowerShellGet 3.0 Preview 16 to prevent breaks as preview is updated

## [2.0.0] - 2022-10-20
### Changed
- Action restructured to use dot sourcing
- Backend uses PowerShellGet 3
- Inputs and outputs are now camel cased

### Fixed
- Recoded to be more platform-agnostic

### Security
- Output and environment variables updated to use environment files

## [1.0.0] - 2021-04-09
### Added
- Initial release

[Unreleased]: https://github.com/natescherer/update-powershell-metadata-action/compare/v2.0.1..HEAD
[2.0.1]: https://github.com/natescherer/update-powershell-metadata-action/compare/v2.0.0..v2.0.1
[2.0.0]: https://github.com/natescherer/update-powershell-metadata-action/compare/v1.0.0..v2.0.0
[1.0.0]: https://github.com/natescherer/update-powershell-metadata-action/tree/v1.0.0