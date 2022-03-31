#!/bin/bash
echo "#deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list
echo "#deb http://nightly.odoo.com/13.0/nightly/deb/ ./" > /etc/apt/sources.list.d/odoo.list
apt-get update && apt-get upgrade
##===================================================================
## ==== INSTALLING AWESOME DESKTOP ENVIRONMENT - DEBIAN 10
##===================================================================
apt-get install -y xserver-xorg-core sddm awesome open-vm-tools
apt-get install -y sakura gnupg git wget zip unzip htop
apt-get install -y network-manager alsa-tools alsa-utils alsa-oss
apt-get install -y lxappearance xcompmgr breeze-cursor-theme fonts-inconsolata fonts-roboto
apt-get install -y caja engrampa pluma eom mate-calc --no-install-recommends

wget -O ./source/paper-icon-theme_all.deb http://ftp.de.debian.org/debian/pool/main/p/paper-icon-theme/paper-icon-theme_1.5.0+git20200312.aa3e8af-3_all.deb
wget -O ./source/atom-amd64.deb https://atom.io/download/deb

dpkg -i ./source/deepin-gtk-theme_17.10.11_all.deb
apt-get -y --fix-broken install
dpkg -i ./source/paper-icon-theme_all.deb
apt-get -y --fix-broken install
dpkg -i ./source/atom-amd64.deb
apt-get -y --fix-broken install

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
unzip ./source/simplicity -d /usr/share/sddm/themes
cp ./source/cfg-sddm/sddm.conf /etc/
mkdir -p /etc/skel/.config
cp -r ./source/cfg-awesome/* /etc/skel/.config
rm -rf /home/ocusr00 && deluser ocusr00
adduser ocusr00
