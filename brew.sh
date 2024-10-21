# Homebrew Installations

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Universal
brew install git
brew install git-lfs
brew install rename
brew install tree

# WSL Ubuntu
brew install nvtop

# # Mac OS
# # Mac OS: GNU utilities
# # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils
# # Install some other useful utilities like `sponge`.
# brew install moreutils
# # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# # Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
# # Mac OS : Tools
# TODO: If Mac then run else skip
# brew install vim --with-override-system-vi
# brew install grep
# brew install openssh
# brew install screen
# brew install homebrew/php/php56 --with-gmp
# # Mac OS: Apps Text Editing
# brew cask install iterm2
# brew cask install macdown
# brew cask install boostnote
# brew cask install sublime-text
# brew cask install diffmerge
# # Mac OS: Apps UX/UI
# brew cask install spectacle
# brew install flux

# Remove outdated versions from the cellar.
brew cleanup