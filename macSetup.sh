#!/bin/sh
#Get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Setup Git
cp gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

#Setup for vim
brew install vim
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/alvan/vim-closetag.git ~/.vim/bundle/vim-closetag

#Setup VSCode
brew cask install visual-studio-code

#Setup java
brew cask install java
code --install-extension redhat.java
source ~/.zshrc

#Install useful programs I always use
brew cask install eclipse-ide 
brew cask install iterm2
brew cask install textual
brew cask install the-unarchiver
brew cask install google-chrome
brew cask install firefox
brew install maven
brew install gradle
brew cask install virtualbox
brew cask install virtualbox-extension-pack

#Setup Golang
while true; do
    read -p "Do you wish to setup golang?" golang
    case $golang in
        [Yy]* ) mkdir ~/go
                mkdir ~/go/src
                mkdir ~/go/bin
                mkdir ~/go/pkg
                git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
                brew install go
                code --install-extension lukehoban.go
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


#Setup haskell
while true; do
    read -p "Do you wish to setup haskell?" haskell
    case $haskell in
        [Yy]* ) brew cask install haskell-platform
                mkdir ~/Haskell
                code --install-extension justusadam.language-haskell
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup Javascript development
while true; do
    read -p "Do you wish to setup useful Javascript tools (npm, jshint, etc..)?" javascript
    case $javascript in
        [Yy]* ) code --install-extension dbaeumer.jshint
                brew install npm
                npm install -g jshint
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup Android studio and Android libraries
while true; do
    read -p "Do you wish to setup Android development tools?" android
    case $android in
        [Yy]* ) brew cask install android-studio
                brew cask install android-sdk
                brew cask install android-ndk
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup Octave/MATLAB
while true; do
    read -p "Do you wish to setup Octave/MATLAB?" octave
    case $octave in
        [Yy]* ) brew tap homebrew/science
                brew cask install xquartz
                brew install octave
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Only do these on a personal (IE non-work machine)
while true; do
    read -p "Do you wish to setup personal use programs (games, office, etc..)?" personal
    case $personal in
        [Yy]* ) brew cask install teamviewer
                brew cask install battle-net
                brew cask install proxpn
                brew cask install amazon-music
                brew cask install vmware-fusion
                brew cask install microsoft-office
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup lastpass
brew cask install lastpass
open /usr/local/Caskroom/lastpass/latest/LastPass\ Installer.app

#Setup oh-my-zsh
brew install zsh
cp zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"