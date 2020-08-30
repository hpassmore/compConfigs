#!/bin/bash
sudo pacman -Syu
sudo pacman -S zsh
sudo pacman -S git
sudo pacman -S curl
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp zshrc ~/.zshrc
cp holojack.zsh-theme ~/.oh-my-zsh/themes/holojack.zsh-theme
chsh -s /bin/zsh
source ~/.zshrc

#Setup Git
cp gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "holojack123@gmail.com"
git config --global user.name "Howard Passmore"

#Setup Vim
sudo pacman -S vim
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


#setup VS Code OSS
sudo pacman -S code
code --install-extension tyriar.sort-lines

#Setup python
pip install flake8
pip3 install flake8
pip install pylint
pip3 install pylint
pip install autopep8
pip3 install autopep8
sudo pacman -S pyenv
code --install-extension ms-python.python

#Install programs I always use
sudo pacman -S docker
sudo pacman -S gimp
sudo pacman -S wine winetricks
sudo pacman -S pamac
sudo pacman -S samba
sudo pacman -S tmux
sudo pacman -S virtualbox-host-dkms virtualbox
sudo pacman -S virtualbox-guest-iso
pamac build virtualbox-ext-oracle

#setup java
sudo pacman -S jdk-openjdk maven gradle
code --install-extension redhat.java

#Setup golang
sudo pacman -S go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
code --install-extension golang.go
go get github.com/nsf/gocode
go get -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -v github.com/sqs/goreturns
go get -v github.com/rogpeppe/godef
go get -u golang.org/x/lint/golint

#Setup Haskell
sudo pacman -S ghc-static
pamac cabal-static
cabal update
cabal install hlint
code --install-extension justusadam.language-haskell
code --install-extension hoovercj.haskell-linter

#Setup javascript
sudo pacman -S nodejs npm
sudo npm install -g jshint
code --install-extension dbaeumer.jshint

#Setup Android
pamac build android-studio
pamac build android-sdk android-sdk-build-tools android-sdk-platform-tools android-platform android-ndk android-emulator

#Setup octave/Matlab
sudo pacman -S octave
code --install-extension Gimly81.matlab

#Post-install
tar -xvf plasma-backup* -C ~/.config
cp vs_code_settings.json ~/.config/Code\ -\ OSS/User/settings.json
cp tmux.conf ~/.tmux.conf
code &
echo
echo "/////////////////////////"
echo "//// Script complete ////"
echo "/////////////////////////"
echo 

echo "Still left to install on own (no way to automate right now that I know of):"
cat installManually
echo
