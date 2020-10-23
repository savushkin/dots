#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

apt update
apt upgrade -y

while read -u3 PACKAGE
do
  echo "$PACKAGE"

  if apt install -y "${PACKAGE}"
  then
    read -n 1 -p "${PACKAGE} package have problems, continue?"
  fi

done 3< <(cat packages/*.packages | sort | uniq)

pip3 install pywal

for INSTALL_SCRIPT in ./scripts/install-*.sh
do
  bash "${INSTALL_SCRIPT}" -H
done

apt autoclean
apt autoremove -y
