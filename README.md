# dervism's Homebrew tap

Homebrew formulae for projects by [dervism](https://github.com/dervism).

## Formulae

| Formula | Description |
| --- | --- |
| [git-agent](#git-agent) | Generate git commit messages from your changes with a language model |

### git-agent

[git-agent](https://github.com/dervism/git-agent) writes git commit messages for your
changes with a language model, running on your own machine or at a cloud provider.
Homebrew builds it from source, and installs its own Rust for the build if you don't
have it yet. Its [README](https://github.com/dervism/git-agent#readme) explains how to
set it up.

## Installing

Install a formula by its full name:

```sh
brew install dervism/tap/git-agent
```

This trusts only the formula you install, not the rest of this tap.
`brew upgrade git-agent` updates it later.

### By short name

Homebrew only loads formulae from taps outside Homebrew that you have trusted. To
install by the short name, tap the repository and trust the formula first:

```sh
brew tap dervism/tap
brew trust --formula dervism/tap/git-agent
brew install git-agent
```

### In a Brewfile

For `brew bundle`, mark the formula as trusted:

```ruby
brew "dervism/tap/git-agent", trusted: true
```

`brew help`, `man brew` or [Homebrew's documentation](https://docs.brew.sh) explain
the rest.
