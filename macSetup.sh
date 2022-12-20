#!/bin/sh
#Get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Setup oh-my-zsh. Need to source zshrc which causes script to be ran twice. 
brew install zsh
cp zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp holojack.zsh-theme ~/.oh-my-zsh/themes/holojack.zsh-theme
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
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
git clone https://github.com/bling/vim-bufferline ~/.vim/bundle/vim-bufferline

#Setup VSCode
brew cask install vscodium
code --install-extension tyriar.sort-lines

#Setup Java
brew cask install adoptopenjdk
code --install-extension redhat.java

#Setup Python
brew install python3
brew postinstall python3
brew install python2
brew postinstall python2
pip install flake8
pip3 install flake8
pip install autopep8
pip3 install autopep8
brew install pyenv
code --install-extension ms-python.python

#Install useful programs I always use
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew cask install eclipse-ide 
brew cask install iterm2
brew install tmux
brew cask install textual
brew cask install the-unarchiver
brew cask install google-chrome
brew cask install firefox
brew install maven
brew install gradle
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install docker

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
                code --install-extension golang.go
                brew install gotags
                go get github.com/nsf/gocode
                go get -v github.com/uudashr/gopkgs/cmd/gopkgs
                go get -v github.com/sqs/goreturns
                go get -v github.com/rogpeppe/godef
                go get -u golang.org/x/lint/golint
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
        [Yy]* ) brew cask install battle-net
                brew cask install microsoft-office
                brew cask install proxpn
                brew cask install teamviewer
                brew cask install tunnelblick
                brew cask install twitch
                brew cask install vmware-fusion
                #BNet has extra setup
                open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Setup lastpass
brew cask install lastpass

#Post install
cp tmux.conf ~/.tmux.conf
echo
echo "Opening apps that have addition setup. Some need to be opened to finish extra downloads, like VS code"
echo
open /Applications/Google\ Chrome.app
open /usr/local/Caskroom/lastpass/latest/LastPass\ Installer/LastPass\ Installer.app

cp vs_code_settings.json ~/Library/Application\ Support/Code/User/settings.json
code &

echo
echo "/////////////////////////"
echo "//// Script complete ////"
echo "/////////////////////////"
echo 
