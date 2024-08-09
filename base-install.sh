#!/usr/bin/env bash
echo
echo "init..."
echo


#AUR
mkdir Sources
cd Sources
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Color pacman
echo -e "Color\r\nILoveCandy" >> /etc/pacman.conf

cd $HOME

PKGS=(
        'xorg-server'           
        'xorg-apps'             
        'xorg-xinit'           
        'xf86-video-amdgpu'      
        'mesa'                  
        'xf86-input-libinput'  
        'libva-mesa-driver'
        'mesa-vdpau'
        'lib32-mesa' 
        'bluez'
        'bluez-utils'
        'blueman'
        'code'
        'i3-gaps'           
        'i3ipc-glib-git' 
        'polybar'           
        'network-manager-applet'      
        'lightdm'                  
        'rofi'
        'nitrogen'
        'pulseaudio'
        'pulseaudio-alsa' 
        'python-pip'
        'zsh'
        'dunst'
        'picom'
        'btop'
        'terminus-font'
        'gnome-screenshot'
        'telegram-desktop'
        'mpd'
        'lxappearance'
        'xfce4-terminal'
        'xdg-user-dirs'
        'alsa-utils' 
        'pavucontrol'
        'w3m'
        'ttf-font-awesome'
        'pywal'
        'xf86-input-synaptics'
        )

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pacman -S "$PKG"
done

xdg-user-dirs-update

#bluetooth
sudo systemctl enable bluetooth

#laptop battery consumption

#pacman -S tlp tlp-rdw powertop acpi
#systemctl enable tlp
#systemctl enable tlp-sleep
#sudo systemctl mask systemd-rfkill.service
#sudo systemctl mask systemd-rfkill.socket

#SSD
systemctl enable fstrim.timer

yay -S oh-my-zsh-git nerd-fonts-hack meowfetch pa-applet-git

chsh -l
chsh -s /usr/bin/zsh

git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/oh-my-zsh/themes/powerlevel9k 

cp .zshrc ~/.zshrc

curl https://cypherpunks.com.br/artes/Artistas/Vinicius%20Yaunner/beauty-death.png > pywallbase.png
curl https://cypherpunks.com.br/artes/Artistas/Vinicius%20Yaunner/flower-cypher.png > wallpaper.jpg

mv pywallbase.png ~/Pictures
mv wallpaper.jpg ~/Pictures


git clone https://aur.archlinux.org/lightdm-webkit2-theme-glorious.git
cd lightdm-webkit2-theme-glorious
makepkg -sri
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf

cd $HOME

echo
echo "Done!"
echo
