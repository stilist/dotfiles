# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- If session is connected via SSH the hostname will be followed by the name of the machine that made the connection
- Put a colored emoji next to the hostname as a reminder of how dangerous a bad command on the host will be — these use a continuous color scale so they should be usable with colorblindness
- Add `-r` flag ('reverse') to `histgrep`
- Add `generate-ssh-key` command
- Add files in `$HOME/.kube/configs` to `$KUBECONFIG`
- Run `pyenv init` with `.profile`
- Handle more module filenames

### Changed
- Add `--` to all `basename` and `dirname` calls so directories with a leading `-` in the name aren’t parsed as arguments

### Fixed
- Check Bash version using `awk` to handle systems that don’t have `bc` installed
- Use `$HISTDIR` in `histgrep` command
- Adjust `histgrep`'s `histgrep_sort` helper to handle files with a `0000-00-00` timestamp in the filename
- Installation no longer requires a `chezmoi.toml` file — the `.gitconfig` template will use default values
- Use `vi` as default text editor if `nano` isn’t installed
- Improve logic for detecting SSH connections
- If a session is connected via SSH the prompt string after the hostname will not be bold
- Fix a bug that made `histgrep` behave differently on macOS and Linux
- Fix incorrect variable-declaration order for handling `.bash_history` file
- Ensure `/Applications/Postgres.app` exists before using it in `$PATH`

## [1.1.0] - 2020-08-19
### Added
- Add Yarn’s paths to `$PATH`
- Set `$GOPATH` and add it to `$PATH`
- When a command is run [display the timestamp above the PS1 command prompt](https://redandblack.io/blog/2020/bash-prompt-with-updating-time/) (only supported for [Bash v4.4 and newer](https://stromberg.dnsalias.org/~strombrg/PS0-prompt/))
- Update global `.gitconfig` (`$HOME/.gitconfig`) to use `develop` as the default branch name for new git repositories (rather than `master`)
- Document how to find a GPG signing key for git
- Add flags to `histgrep` command — run `histgrep -h` for usage information
- Add `ll` alias for macOS
- Look for `$HISTDIR` variable to control where shell history files are stored

### Fixed
- Rename `.sh/` directory and files to match chezmoi’s conventions
- Ensure `histgrep` will always treat history file as text, even if there’s binary data mixed in
- `histgrep` will correctly handle spaces and regular expressions in search strings
- Adjust `session` scripts that modify `$PATH` to always use `which`
- Adjust `lsl` to work with [GNU Core Utilities `ls`’s flags](https://www.gnu.org/software/coreutils/manual/html_node/General-output-formatting.html#General-output-formatting) when run on Linux

### Changed
- Add `~/bin` to `$PATH`
- Add `cp`, `mv`, and `rm` safety aliases that prompt for confirmation — this will affect the behavior of scripts which use these commands
- By default history files are now stored at `~/.local/share/history`, rather than `~/.local/share/history-data/automated imports/shell`; you can make `~/.local/share/history` a symlink if you prefer to keep `~/.local/share/history-data/automated imports/shell` (`ln -s ~/.local/share/history-data/automated imports/shell ~/.local/share/history`)
- History files now include the current username in the file name (for example, `2020-08-11T16.13.21+0000_root@MacBook-Air_47015`) — this is helpful if multiple users on a machine are using these dotfiles

## [1.0.0] - 2019-05-13
### Added
- Initial release of scripts

[Unreleased]: https://github.com/stilist/dotfiles/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/stilist/dotfiles/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/stilist/dotfiles/releases/tag/v1.0.0
