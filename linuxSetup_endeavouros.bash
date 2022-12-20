#!/bin/bash
sudo pacman -Syu
sudo pacman -S zsh
sudo pacman -S git
sudo pacman -S curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp zshrc ~/.zshrc
cp holojack.zsh-theme ~/.oh-my-zsh/themes/holojack.zsh-theme
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
sudo pacman -S samba
sudo pacman -S tmux
sudo pacman -S virtualbox-host-dkms virtualbox
sudo pacman -S virtualbox-guest-iso
yay -S virtualbox-ext-oracle

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

#Post-install
cp vs_code_settings.json ~/.config/Code\ -\ OSS/User/settings.json
cp tmux.conf ~/.tmux.conf
code &

# Most of my manjaro setups dual boot so fix clock
timedatectl set-local-rtc 1 --adjust-system-clock

# SSH Setup
ssh-keygen -t ed25519

echo
echo "/////////////////////////"
echo "//// Script complete ////"
echo "/////////////////////////"
echo 
