#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
brew install ack
#install exiv2
brew install git
#install imagemagick
brew install lynx
brew install node
brew install pigz
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install zopfli
brew install p7zip

# More useful things
brew install bash-completion
brew install ffmpeg
brew install git-extras
brew install sshuttle
brew install tmux
brew install vcprompt
brew install youtube-dl

brew tap homebrew/versions
brew install lua52

# Additional Stuff
# install mysql
# install elasticsearch
# install lftp


# Remove outdated versions from the cellar
brew cleanup

