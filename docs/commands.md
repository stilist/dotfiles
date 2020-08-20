# commands provided by dotfiles

Commands are located in `dot_sh/bin/` in this repository, and `chezmoi` installs them at `$HOME/.sh/bin`.

## `be`

[`be`](../dot_sh/bin/executable_be) is a shorthand for [Bundler](https://bundler.io)’s [`bundle exec`](https://bundler.io/v2.1/man/bundle-exec.1.html). `bundle exec` ‘execute[s] a command in the context of the bundle’.

**Usage**

```shell
be rails server

be rspec
```

## `git-current-ref`

[`git-current-ref`](../dot_sh/bin/executable_git-current-ref) gets the name of the `HEAD` of the current git repository. The [ref](https://git-scm.com/book/en/v2/Git-Internals-Git-References) may be a branch name, a commit hash, or a string that indicates the user is not in a useable ref.
