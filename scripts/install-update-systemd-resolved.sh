#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

EXECUTABLE=update-systemd-resolved
DIR="/opt/update-systemd-resolved"

if [ -f "/etc/openvpn/scripts/${EXECUTABLE}" ]
then
	echo "${EXECUTABLE} is already installed";
else
	echo "${EXECUTABLE} installation";

  git clone -j "$(nproc)" https://github.com/jonathanio/update-systemd-resolved.git "${DIR}"

  cd "${DIR}" || exit

  make
fi
