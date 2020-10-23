#!/bin/bash

DOTS_DIR=$1

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
