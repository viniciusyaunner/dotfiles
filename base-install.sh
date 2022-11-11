#!/usr/bin/env bash
echo
echo "init..."
echo

localectl br-abnt2

#AUR
mkdir Sources
cd Sources
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Color pacman
echo -e "Color\r\nILoveCandy" >> /etc/pacman.conf

yay -S pa-applet-git

PKGS=(
        'xorg-server'           
        'xorg-apps'             
        'xorg-xinit'           
        'xf86-video-amdgpu'      
        'mesa'                  
        'xf86-input-libinput'  
        'vulkan-radeon'
        'libva-mesa-driver'
        'mesa-vdpau'
        'lib32-mesa' 
        'bluez'
        'bluez-utils'
        'blueman'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pacman -S "$PKG" --noconfirm --needed
done

#bluetooth
sudo systemctl enable bluetooth

#laptop battery consumption

#pacman -S tlp tlp-rdw powertop acpi
#systemctl enable tlp
#systemctl enable tlp-sleep
#sudo systemctl mask systemd-rfkill.service
#sudo systemctl mask systemd-rfkill.socket

#SSD
sudo systemctl enable fstrim.timer

echo
echo "Done!"
echo