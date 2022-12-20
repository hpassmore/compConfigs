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

# Vulkan / gaming setup
while true; do
    echo
    read -p "Do you wish to setup computer for gaming? (y/n)" gaming
    case $gaming in
        [Yy]* ) sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
                    mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
                    lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
                    sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
                    ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
                    lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
                while true; do
                    echo
                    read -p "Does computer contain an NVIDIA graphics card? (y/n)" nvda
                    case $nvda in
                        [Yy]* ) sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
                                break;;
                        [Nn]* ) break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
                while true; do
                    echo
                    read -p "Does computer contain an AMD graphics card? (y/n)" amdc
                    case $amdc in
                        [Yy]* ) sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
                                break;;
                        [Nn]* ) break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


echo
echo "/////////////////////////"
echo "//// Script complete ////"
echo "/////////////////////////"
echo 
