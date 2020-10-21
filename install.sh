#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y language-pack-en language-pack-en-base language-pack-ru language-pack-ru-base
sudo apt install -y network-manager network-manager-openvpn network-manager-pptp openvpn
sudo apt install -y pulseaudio pulseaudio-module-bluetooth pulseaudio-utils

sudo apt install -y git nano mc wget curl make gcc g++ build-essential x11-apps coreutils net-tools blueman

sudo apt install -y python3 python3-pip

sudo pip3 install pywal

#sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo apt install -y xorg xserver-xorg i3 ubuntu-drivers-common mesa-utils mesa-utils-extra compton rofi feh scrot imagemagick

for INSTALL_SCRIPT in ./scripts/install-*.sh
do
  bash "${INSTALL_SCRIPT}" -H
done

sudo update-alternatives --set x-terminal-emulator "$(which kitty)"

rm -rf "${HOME}/.config/dunst"
mkdir -p "${HOME}/.config/dunst"
ln -s "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"

for FILE in $(find ./config ! -path ./config | xargs realpath)
do
  CONFIG_FILE=${FILE/${HOME}\/dots\/config/${HOME}\/.config}

  if [ -d "${FILE}" ]
  then
    rm -rf "${CONFIG_FILE}"
    mkdir -p "${CONFIG_FILE}"
  else
    rm -f "${CONFIG_FILE}"
    ln -s "${FILE}" "${CONFIG_FILE}"
  fi
done

sudo apt autoclean
sudo apt autoremove -y
