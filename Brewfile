#!/bin/bash

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4
brew install bash
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Generic and CTF tools; see https://github.com/ctfs/write-ups.
brew install ack
brew install aircrack-ng
brew install bash-completion
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install elasticsearch
brew install fcrackzip
brew install ffmpeg
brew install foremost
brew install fzf
brew install git
brew install git-extras
brew install git-lfs
brew install grep
brew install hashpump
brew install htop
brew install hydra
brew install imagemagick --with-webp
brew install john
brew install knock
brew install lftp
brew install lua
brew install lynx
brew install mysql
brew install netpbm
brew install nmap
brew install node
brew install openssh
brew install p7zip
brew install pigz
brew install pngcheck
brew install pv
brew install rename
brew install rhino
brew install rlwrap
brew install socat
brew install solr
brew install sqlmap
brew install ssh-copy-id
brew install sshuttle
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install the_silver_searcher
brew install tmux
brew install tree
brew install ucspi-tcp # `tcpserver` etc.
brew install vbindiff
brew install vcprompt
brew install vim --override-system-vi
brew install webkit2png
brew install wget --enable-iri
brew install xpdf
brew install xz
brew install youtube-dl
brew install zopfli

brew cleanup
