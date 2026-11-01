# dervism's Homebrew tap

## git-agent

[git-agent](https://github.com/dervism/git-agent) writes git commit messages for your
changes with a language model, running on your own machine or at a cloud provider.

```sh
brew install dervism/tap/git-agent
```

Homebrew builds git-agent from source, and installs its own Rust for the build if you
don't have it yet. `brew upgrade git-agent` updates it.

## Other ways to use this tap

`brew tap dervism/tap` and then `brew install <formula>`, or in a `brew bundle`
`Brewfile`:

```ruby
tap "dervism/tap"
brew "<formula>"
```

`brew help`, `man brew` or [Homebrew's documentation](https://docs.brew.sh) explain
the rest.
