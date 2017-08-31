#!/bin/sh

#Get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Setup oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zshrc ~/.zshrc

#Setup Git
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

#Setup for vim
brew install vim
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/alvan/vim-closetag.git ~/.vim/bundle/vim-closetag

#Setup Golang
mkdir ~/go
mkdir ~/go/src
mkdir ~/go/bin
mkdir ~/go/pkg
brew install go

#Setup haskell
brew cask install haskell-platform
mkdir ~/Haskell

#Setup java
brew cask install java
source ~/.zshrc

#Setup Octave/MATLAB
brew tap homebrew/science
brew cask install xquartz
brew install octave

#Install useful programs
brew cask install eclipse-ide 
brew cask install visual-studio-code
brew cask install iterm2
brew cask install textual
brew cask install teamviewer
brew cask install the-unarchiver
brew cask install google-chrome
brew cask install firefox
brew cask install google-drive
brew cask install battle-net
brew cask install proxpn
brew cask install amazon-music
brew install maven
brew install gradle
brew cask install android-studio
brew cask install android-sdk
brew cask install android-ndk
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vmware-fusion
brew cask install microsoft-office
brew install npm
npm install -g jshint
