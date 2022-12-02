#!/bin/bash

# Install packages after installing base Debian with no GUI

# xorg display server installation and wm
sudo apt install -y xorg xterm termit dunst kitty suckless-tools gmrun

# Microcode for Intel/AMD
# sudo apt install -y amd-microcode
sudo apt install -y firmware-linux-nonfree firmware-realtek dwm

# File Manager
sudo apt install -y vim caca-utils w3m w3m-img highlight mediainfo poppler-utils mc xfe meld

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon

# Neofetch/HTOP
sudo apt install -y neofetch bpytop lm-sensors

# Various utilities
sudo apt install -y feh scrot imagemagick flameshot lxappearance arc-theme gnome-icon-theme rar unrar zip unzip p7zip-full p7zip-rar fzf

# Printing and bluetooth (if needed)
sudo apt install -y cups

# Browser and Mail client Installation (eg. chromium)
sudo apt install -y firefox-esr

# Aditional packages
sudo apt install -y zathura zathura-djvu  simple-scan trayer

# Install fonts
sudo apt install -y fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation xfonts-terminus fonts-jetbrains-mono

#Music and video packages
sudo apt install -y mpv moc sox libsox-fmt-all alsa-utils 

#Torrents
sudo apt install -y transmission-gtk aria2 keepassxc seahorse gpa mat2 libnotify-bin

#Install Office packages
sudo apt install -y libreoffice libreoffice-gtk3

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
