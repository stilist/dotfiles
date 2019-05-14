# dotfiles

This repository has my personal set of [dotfiles](https://dotfiles.github.io),
split across three main categories:

* True ‘dotfiles’ -- configuration files with a name that begins with a `.`
  (like `.profile`).
* Utility scripts are in `~/.sh/bin`. Each has a documentation block that
  explains what the script does, and demonstrates how to use it. I use the
  `histgrep` and `switch` utility scripts a *lot*.
* ‘Session’ scripts are in `~/.sh/session`. These scripts do things like adding
  to `$PATH`, creating shell aliases, and defining environment variables.

## Installation

This repository depends on the [`chezmoi` tool](https://github.com/twpayne/chezmoi). Once you’ve installed `chezmoi`, run this command in your terminal:

```shell
chezmoi init --apply --verbose https://github.com/stilist/dotfiles.git
```

To make git commits, you’ll need to make sure `~/.config/chezmoi/chezmoi.toml`
has these keys defined, with your own values filled in:

```toml
[data]
name = "Your name here"

[data.git]
# @see https://github.com/settings/emails
email = "Your email here"
signingkey = "Your GPG key here"
```

You can read [the `chezmoi` documentation](https://github.com/twpayne/chezmoi/tree/master/docs) for more information on how to use the tool.
