#!/bin/bash

# Install packages after installing base Debian with no GUI

# xorg display server installation and wm
sudo apt install -y xorg xterm xmonad xmobar trayer mate-polkit-bin dunst kitty suckless-tools

# Microcode for Intel/AMD 
# sudo apt install -y amd-microcode
sudo apt install -y firmware-linux-nonfree firmware-realtek 

# File Manager (eg. pcmanfm,krusader)
sudo apt install -y vim vifm neovim atool caca-utils w3m w3m-img highlight mediainfo poppler-utils mc udisks2 udiskie

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon

sudo systemctl enable avahi-daemon

# Neofetch/HTOP
sudo apt install -y neofetch bpytop lm-sensors smartmontools

# Various utilities
sudo apt install -y feh scrot imagemagick maim xwallpaper flameshot lxappearance arc-theme gnome-icon-theme rar unrar p7zip-full p7zip-rar 

# Printing and bluetooth (if needed)
sudo apt install -y cups
sudo systemctl enable cups

# Browser and Mail client Installation (eg. chromium)
sudo apt install -y firefox-esr thunderbird picom 

# Aditional packages
sudo apt install -y zathura zathura-djvu  simple-scan 

# Install fonts
sudo apt install -y fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation xfonts-terminus fonts-jetbrains-mono

#Music and video packages
sudo apt install -y mpv cmus sox libsox-fmt-all alsa-utils pulseaudio pavucontrol

#Torrents
sudo apt install -y transmission-gtk aria2 keepassxc seahorse gpa metadata-cleaner libnotify-bin 

#Install Office packages
sudo apt install -y libreoffice libreoffice-gtk3 

#Nvidia  driver
sudo apt install -y linux-headers-amd64 

sudo apt install -y nvidia-driver

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
