#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
            language-pack-en language-pack-en-base language-pack-ru language-pack-ru-base \
            network-manager network-manager-openvpn network-manager-pptp openvpn iptables-persistent \
            pulseaudio pulseaudio-module-bluetooth pulseaudio-utils \
            kitty pcmanfm udiskie \
            ubuntu-restricted-extras \
            git nano mc wget curl make gcc g++ build-essential x11-apps coreutils net-tools blueman \
            python3 python3-pip

sudo pip3 install pywal

if dpkg-query -W "gdm3"
then
	echo "gdm3 is already installed";
	echo "lightdm installation skipped";
else
	echo "lightdm installation";

	sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
fi

sudo apt install -y xorg xserver-xorg i3 ubuntu-drivers-common mesa-utils mesa-utils-extra compton rofi feh scrot imagemagick

sudo iptables -t mangle -A POSTROUTING -j TTL --ttl-set 65
sudo iptables-save --file /etc/iptables/rules.v4

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
  CONFIG_FILE=${FILE/$(realpath .)\/config/${HOME}\/.config}
  echo "${CONFIG_FILE}"
  if [ -d "${FILE}" ]
  then
    echo "renew directory: ${CONFIG_FILE}"
    rm -rf "${CONFIG_FILE}"
    mkdir -p "${CONFIG_FILE}"
  else
    echo "create symlink for: ${CONFIG_FILE}"
    rm -f "${CONFIG_FILE}"
    ln -s "${FILE}" "${CONFIG_FILE}"
  fi
done

sudo apt autoclean
sudo apt autoremove -y
