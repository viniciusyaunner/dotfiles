#!/usr/bin/env bash

git clone -b v3 --depth 1 https://www.github.com/keyitdev/dotfiles.git
cd dotfiles
chmod +x install-on-arch.sh
./install-on-arch.sh



# PKGS=(
#         'i3-gaps'           
#         'i3ipc-glib-git' 
#         '3lock-color'            
#         'polybar'           
#         'network-manager-applet'      
#         'sddm'                  
#         'lightdm-webkit2-greeter'  
#         'rofi'
#         'nitrogen'
#         'pulseaudio'
#         'pulseaudio-alsa' 
#         'python-pip'
#         'kitty'
#         'zsh'
#         'dunst'
#         'dolphin'
#         'picom'
#         'ranger'
#         'btop'
# )

# for PKG in "${PKGS[@]}"; do
#     echo "INSTALLING: ${PKG}"
#     yay -S "$PKG" --noconfirm --needed
# done