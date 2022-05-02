#!/bin/bash

DOTS_DIR="$(realpath .)"

sudo rm -rf \
"${HOME}/.bash_aliases" \
"${HOME}/.bashrc" \
"${HOME}/.Xresources" \
"${HOME}/.config/dunst" \
"${DOTS_DIR}/config/systemd/user/polybar-bottom@.service.d" \
"${DOTS_DIR}/config/systemd/user/polybar-top@.service.d" \
"${DOTS_DIR}/config/systemd/user/polybar-top-tray@.service.d" \
"/etc/lightdm/lightdm.conf" \
"/etc/lightdm/lightdm-gtk-greeter.conf" \
"/etc/polybar-modules/tinkoff-invest" \
"/usr/share/xsessions/systemd.desktop"

mkdir -p "${HOME}/.config/dunst"
mkdir -p "${HOME}/.cache"

sudo mkdir -p /etc/lightdm
sudo mkdir -p /etc/polybar-modules/tinkoff-invest

ln -s "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"
ln -s "${DOTS_DIR}/bashrc.sh" "${HOME}/.bashrc"
ln -s "${DOTS_DIR}/bash_aliases.sh" "${HOME}/.bash_aliases"
ln -s "${DOTS_DIR}/Xresources" "${HOME}/.Xresources"
sudo ln -s "${DOTS_DIR}/lightdm.conf" "/etc/lightdm/lightdm.conf"
sudo ln -s "${DOTS_DIR}/lightdm-gtk-greeter.conf" "/etc/lightdm/lightdm-gtk-greeter.conf"
sudo ln -s "${DOTS_DIR}/config/xsessions/systemd.desktop" "/usr/share/xsessions/systemd.desktop"

if [ ! -f "${DOTS_DIR}/environment/i3.conf" ]
then
  cp "${DOTS_DIR}/environment/templates/i3.template.conf" "${DOTS_DIR}/environment/i3.conf"
fi

if [ ! -f "${DOTS_DIR}/environment/polybar.conf" ]
then
  cp "${DOTS_DIR}/environment/templates/polybar.template.conf" "${DOTS_DIR}/environment/polybar.conf"
fi

if [ ! -f "${DOTS_DIR}/environment/tinkoff-invest.appsettings.json" ]
then
  cp "${DOTS_DIR}/environment/templates/tinkoff-invest.appsettings.template.json" "${DOTS_DIR}/environment/tinkoff-invest.appsettings.json"
fi

mkdir -p "${DOTS_DIR}/config/systemd/user/polybar-bottom@.service.d"
mkdir -p "${DOTS_DIR}/config/systemd/user/polybar-top@.service.d"
mkdir -p "${DOTS_DIR}/config/systemd/user/polybar-top-tray@.service.d"

ln -s "${DOTS_DIR}/environment/polybar.conf" "${DOTS_DIR}/config/systemd/user/polybar-bottom@.service.d/polybar.conf"
ln -s "${DOTS_DIR}/environment/polybar.conf" "${DOTS_DIR}/config/systemd/user/polybar-top@.service.d/polybar.conf"
ln -s "${DOTS_DIR}/environment/polybar.conf" "${DOTS_DIR}/config/systemd/user/polybar-top-tray@.service.d/polybar.conf"

sudo ln -s "${DOTS_DIR}/environment/tinkoff-invest.appsettings.json" "/etc/polybar-modules/tinkoff-invest/appsettings.json"

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

systemctl --user daemon-reload
systemctl --user enable \
i3wm.service \
compton.service \
setxkbmap.service \
polybar.service \
theming.service \
wallpaper.service \
tray.target \
network-manager-applet.service \
blueman-applet.service \
udiskie.service \
telegram-desktop.service \
jetbrains-toolbox.service
