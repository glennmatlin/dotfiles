# Homebrew

## Setup

0. Install brew
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

1. Make sure we’re using the latest Homebrew.
`brew update

2. Upgrade any already-installed formulae.
brew upgrade

# Brew Installations
brew install git git-lfs
brew install thefuck
brew install uv
brew install nvtop

## Mac OS

### Mac OS: GNU utilities

Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
1. `brew install coreutils`
1. `brew install moreutils`
1. `brew install findutils`
1. `brew install gnu-sed --with-default-names`

### Mac OS : Tools

1. `brew install git git-lfs`
1. `brew install nvim`
1. `brew install grep`
1. `brew install openssh`

### Mac OS: GUI/UX Apps

1. `brew cask install iterm2`
1. `brew cask install sublime-text`
1. `brew cask install spectacle`
1. `brew install flux`
