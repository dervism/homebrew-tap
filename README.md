# dervism's Homebrew tap

## git-agent

[git-agent](https://github.com/dervism/git-agent) writes git commit messages for your
changes with a language model, running on your own machine or at a cloud provider.

```sh
brew install dervism/tap/git-agent
```

Homebrew builds git-agent from source, and installs its own Rust for the build if you
don't have it yet. `brew upgrade git-agent` updates it. Installing by the full name
trusts only the git-agent formula, not the rest of this tap.

## Other ways to install

Homebrew only loads formulae from taps outside Homebrew that you have trusted. To
install by the short name, tap the repository and trust the formula first:

```sh
brew tap dervism/tap
brew trust --formula dervism/tap/git-agent
brew install git-agent
```

In a `Brewfile` for `brew bundle`:

```ruby
brew "dervism/tap/git-agent", trusted: true
```

`brew help`, `man brew` or [Homebrew's documentation](https://docs.brew.sh) explain
the rest.
