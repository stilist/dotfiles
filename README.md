# dotfiles

To get started, clone this repository, then run these commands in your terminal:

1. `cd dotfiles`
1. `DOTFILES_PATH="$(pwd)" support/bootstrap`

This will install a `crontab` that automatically updates `dotfiles` at the start of each hour. The `crontab` will pull down the latest version of the repository (`support/update.sh`), and update your `.profile` and so on to match what’s in the repository (`support/export-files.rb`).

`support/bootstrap` will also run `support/export-files.rb` immediately, to get your machine set up. On this first run, if `support/export-files.rb` tries to copy a file that already exists, the existing file will be renamed with `.backup` -- for example, `.profile` would be moved to `.profile.backup`.

## Running the updater manually

1. `cd dotfiles`
1. `DOTFILES_PATH="$(pwd)" support/update.sh`
