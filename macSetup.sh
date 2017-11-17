#!/bin/sh
#Get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Setup oh-my-zsh. Need to source zshrc which causes script to be ran twice. 
brew install zsh
cp zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc

#Setup Git
cp gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

#Setup Vim
brew install vim
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/alvan/vim-closetag.git ~/.vim/bundle/vim-closetag

#Setup VSCode
brew cask install visual-studio-code

#Setup Java
brew cask install java
code --install-extension redhat.java

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
    echo
    read -p "Do you wish to setup golang? (y/n) " golang
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


#Setup Haskell
while true; do
    echo
    read -p "Do you wish to setup haskell? (y/n) " haskell
    case $haskell in
        [Yy]* ) brew cask install haskell-platform
                mkdir ~/Haskell
                cabal install hlint
                code --install-extension justusadam.language-haskell
                code --install-extension hoovercj.haskell-linter
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup Javascript
while true; do
    echo
    read -p "Do you wish to setup useful Javascript tools (npm, jshint, etc..)? (y/n) " javascript
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
    echo
    read -p "Do you wish to setup Android development tools? (y/n) " android
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
    echo
    read -p "Do you wish to setup Octave/MATLAB? (y/n) " octave
    case $octave in
        [Yy]* ) brew tap homebrew/science
                brew cask install xquartz
                brew install octave
                code --install-extension Gimly81.matlab
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Only do these on a personal (IE non-work machine)
while true; do
    echo
    read -p "Do you wish to setup personal use programs (games, office, etc..)? (y/n) " personal
    case $personal in
        [Yy]* ) brew cask install teamviewer
                brew cask install battle-net
                brew cask install proxpn
                brew cask install vmware-fusion
                brew cask install microsoft-office
                #BNet has extra setup
                open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup lastpass
brew cask install lastpass
open /usr/local/Caskroom/lastpass/latest/LastPass\ Installer.app

echo
echo "/////////////////////////"
echo "//// Script complete ////"
echo "/////////////////////////"
echo 

echo "Still left to install on own (no way to automate right now that I know of):"
cat macInstallOnOwn
echo
