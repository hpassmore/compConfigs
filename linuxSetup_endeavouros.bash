#!/bin/bash
sudo pacman -Syu
sudo pacman -S --needed zsh
sudo pacman -S --needed git
sudo pacman -S --needed curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp zshrc ~/.zshrc
cp holojack.zsh-theme ~/.oh-my-zsh/themes/holojack.zsh-theme

#Setup Git
cp gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "howard.passmore17@gmail.com"
git config --global user.name "Howard Passmore"

#Setup Vim
sudo pacman -S --needed vim
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

#setup VSCodium
yay -S --needed vscodium-bin
codium --install-extension tyriar.sort-lines
codium --install-extension jeanp413.open-remote-ssh

#Setup python
sudo pacman -S --needed python-pip
pip install flake8
pip install pylint
pip install autopep8
sudo pacman -S --needed pyenv
codium --install-extension ms-python.python
codium --install-extension ms-python.flake8

#Install programs I always use
sudo pacman -S --needed docker
sudo pacman -S --needed gimp
sudo pacman -S --needed samba
sudo pacman -S --needed tmux
sudo pacman -S --needed virtualbox-host-dkms virtualbox
sudo pacman -S --needed virtualbox-guest-iso
sudo pacman -S --needed reflector
sudo pacman -S --needed libreoffice-fresh
sudo systemctl enable --now reflector.timer
yay -S --needed virtualbox-ext-oracle

#setup java
sudo pacman -S --needed jdk-openjdk maven gradle
codium --install-extension redhat.java

#Setup golang
sudo pacman -S --needed go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
codium --install-extension golang.go

#Post-install
cp vs_code_settings.json ~/.config/VSCodium/User/settings.json
cp tmux.conf ~/.tmux.conf

# Most of my manjaro setups dual boot so fix clock in windows. Mandate utc usage here
timedatectl set-local-rtc 1 --adjust-system-clock

# SSH Setup
ssh-keygen -t ed25519

# Vulkan / gaming setup
while true; do
    echo
    read -p "Do you wish to setup computer for gaming? (y/n)" gaming
    case $gaming in
        [Yy]* ) sudo pacman -S --needed wine-staging winetricks zenity giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
                    mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
                    lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
                    sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
                    ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lutris\
                    lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader steam
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

# Wayland setup
nvda_wayland=0
while true; do
    echo
    read -p "Do you wish to setup Wayland? (y/n)" wylnd
    case $wylnd in
        [Yy]* ) mkdir -p ~/.config/environment.d
                echo "MOZ_ENABLE_WAYLAND=1" >> ~/.config/environment.d/firefox-wayland.conf
                sudo pacman -S --needed xorg-xwayland
                while true; do
                    echo 
                    read -p "Does computer contain an NVIDIA graphics card? (y/n)" wylndnvda
                    case $wylndnvda in
                        [Yy]* ) nvda_wayland=1
                                sudo systemctl enable nvidia-resume.service
                                sudo systemctl enable nvidia-hibernate.service
                                sudo systemctl enable nvidia-suspend.service
                                echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/tmp" | sudo tee -a /etc/modprobe.d/nvidia-power-management.conf > /dev/null
                                break;;
                        [Nn]* ) break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
                while true; do
                    echo 
                    read -p "Does computer use KDE Plasma? (y/n)" wylndnvda
                    case $wylndnvda in
                        [Yy]* ) sudo pacman -S plasma-wayland-session
                                break;;
                        [Nn]* ) break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
                break;;
        [Nn]* ) nvda_wayland=0
                break;;
        * ) echo "Please answer yes or no.";;
    esac
done


echo
echo "/////////////////////////////////////////////////////////////////////////////////////////////////////"
echo "////                                  Script complete                                            ////"
if [ "$nvda_wayland" -eq "1" ]; then
    echo "///// YOU LIKELY NEED TO FOLLOW https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting /////"
fi
echo "/////////////////////////////////////////////////////////////////////////////////////////////////////"
echo 

codium & 
