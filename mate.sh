#!/bin/bash
#===================================================================
# INSTALLING MATE DESKTOP ENVIRONMENT - DEBIAN 10
#===================================================================
apt-get install -y xserver-xorg-core sddm open-vm-tools
apt-get install -y --no-install-recommends mate-desktop-environment-core mate-menu
apt-get install -y mate-tweak network-manager-gnome network-manager-openvpn-gnome
apt-get install -y sakura gnupg wget git zip unzip htop
apt-get install -y eom pluma mate-calc engrampa
apt-get install -y breeze-cursor-theme fonts-inconsolata fonts-roboto
apt-get install -y alsa-tools alsa-utils alsa-oss

dpkg -i ./src-mate/paper-icon-theme_1.5.0_all.deb
dpkg -i ./src-mate/deepin-gtk-theme_17.10.11_all.deb

#============ INSTALL LIBREOFFICE
apt-get install -y libreoffice-calc --no-install-recommends
apt-get install -y libreoffice-writer --no-install-recommends
apt-get install -y libreoffice-gtk3

#============ INSTALL BRAVE-BROWSER
apt-get install -y apt-transport-https gnupg
apt-key adv --fetch-keys https://brave-browser-apt-release.s3.brave.com/brave-core.asc
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ buster main" > /etc/apt/sources.list.d/brave-browser.list
apt-get update && apt-get install -y brave-keyring brave-browser

#============ INSTALL SPOTIFY
apt-key adv --fetch-keys https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
apt-get update && apt-get install -y spotify-client

#============ CHANGE SETTINGS
sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf
unzip ./src-mate/config.zip -d /etc/skel
reboot
