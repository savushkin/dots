#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

SUDO_USER=$1

SUDOERS_PATH="/etc/sudoers.d/01-${SUDO_USER}"

if [ ! -f "${SUDOERS_PATH}" ]
then
  echo "${SUDO_USER} ALL=(ALL) NOPASSWD:ALL" | tee "${SUDOERS_PATH}"
  chmod 440 "${SUDOERS_PATH}"
fi

update-alternatives --set x-terminal-emulator "$(which kitty)"

iptables -t mangle -A POSTROUTING -j TTL --ttl-set 65
iptables-save --file /etc/iptables/rules.v4
