#!/bin/bash
echo "#deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list
echo "#deb http://nightly.odoo.com/13.0/nightly/deb/ ./" > /etc/apt/sources.list.d/odoo.list
apt-get update && apt-get upgrade
##===================================================================
## ==== INSTALLING MATE DESKTOP ENVIRONMENT - DEBIAN 10
##===================================================================
apt-get install -y xserver-xorg-core sddm open-vm-tools
apt-get install -y --no-install-recommends mate-desktop-environment-core mate-menu
apt-get install -y mate-tweak network-manager-gnome network-manager-openvpn-gnome
apt-get install -y sakura gnupg wget git zip unzip htop
apt-get install -y eom pluma mate-calc engrampa
apt-get install -y breeze-cursor-theme fonts-inconsolata fonts-roboto
apt-get install -y alsa-tools alsa-utils alsa-oss mate-applets

wget -O ./source/paper-icon-theme_all.deb http://ftp.de.debian.org/debian/pool/main/p/paper-icon-theme/paper-icon-theme_1.5.0+git20200312.aa3e8af-3_all.deb
wget -O ./source/codium_1.71.2.22258_amd64.deb https://github.com/VSCodium/vscodium/releases/download/1.71.2.22258/codium_1.71.2.22258_amd64.deb
#wget -O ./source/atom-amd64.deb https://atom.io/download/deb


dpkg -i ./source/deepin-gtk-theme_17.10.11_all.deb
apt-get -y --fix-broken install
dpkg -i ./source/paper-icon-theme_all.deb
apt-get -y --fix-broken install
dpkg -i ./codium_1.71.2.22258_amd64.deb
apt-get -y --fix-broken install
#dpkg -i ./source/atom-amd64.deb
#apt-get -y --fix-broken install

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
unzip ./source/simplicity -d /usr/share/sddm/themes
cp ./source/cfg-sddm/sddm.conf /etc/
mkdir -p /etc/skel/.config
cp -r ./source/cfg-mate/* /etc/skel/.config
rm -rf /home/ocusr00 && deluser ocusr00
adduser ocusr00
