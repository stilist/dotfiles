# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Add Yarn’s paths to `$PATH`
- Set `$GOPATH` and add it to `$PATH`
- When a command is run [display the timestamp above the PS1 command prompt](https://redandblack.io/blog/2020/bash-prompt-with-updating-time/)

### Fixed
- Rename `.sh/` directory and files to match chezmoi’s conventions
- Ensure `histgrep` will always treat history file as text, even if there’s binary data mixed in

## [1.0.0] - 2019-05-13
### Added
- Initial release of scripts

[1.0.0]: https://github.com/stilist/dotfiles/releases/tag/v1.0.0
