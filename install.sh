#!/bin/bash

SUDOERS_PATH="/etc/sudoers.d/01-${USER}"

if sudo [ ! -f "${SUDOERS_PATH}" ]
then
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee "${SUDOERS_PATH}"
sudo chmod 440 "${SUDOERS_PATH}"
fi

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
            language-pack-en language-pack-en-base language-pack-ru language-pack-ru-base \
            openvpn iptables-persistent \
            pulseaudio pulseaudio-module-bluetooth pulseaudio-utils \
            kitty pcmanfm udiskie \
            ubuntu-drivers-common ubuntu-restricted-extras \
            git nano mc wget curl make gcc g++ build-essential x11-apps coreutils net-tools blueman \
            python3 python3-pip \
            lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
            xorg xserver-xorg i3 mesa-utils mesa-utils-extra compton rofi feh scrot imagemagick dunst libnotify-bin

sudo apt install --install-suggests --no-install-recommends -y network-manager-gnome

sudo pip3 install pywal

sudo iptables -t mangle -A POSTROUTING -j TTL --ttl-set 65
sudo iptables-save --file /etc/iptables/rules.v4

for INSTALL_SCRIPT in ./scripts/install-*.sh
do
  bash "${INSTALL_SCRIPT}" -H
done

sudo update-alternatives --set x-terminal-emulator "$(which kitty)"

DOTS_DIR=$(realpath .)

sudo rm -rf \
"${HOME}/.bash_aliases" \
"${HOME}/.bashrc" \
"${HOME}/.config/dunst" \
"/etc/lightdm/lightdm-gtk-greeter.conf"

mkdir -p "${HOME}/.config/dunst"

sudo mkdir -p /etc/lightdm

ln -s "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"
ln -s "${DOTS_DIR}/bashrc.sh" "${HOME}/.bashrc"
ln -s "${DOTS_DIR}/bash_aliases.sh" "${HOME}/.bash_aliases"
sudo ln -s "${DOTS_DIR}/lightdm-gtk-greeter.conf" "/etc/lightdm/lightdm-gtk-greeter.conf"

for FILE in $(find "${DOTS_DIR}/config" ! -path "${DOTS_DIR}/config")
do
  CONFIG_FILE=${FILE/${DOTS_DIR}\/config/${HOME}\/.config}
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
