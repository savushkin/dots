#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

export DOCKER_USER=$1

apt update
apt upgrade -y

while read -u3 PACKAGE
do
  apt install --no-install-recommends --yes "${PACKAGE}"
done 3< <(cat packages-without-recommends/*.packages | sort | uniq)

while read -u3 PACKAGE
do
  apt install --yes "${PACKAGE}"
done 3< <(cat packages/*.packages | sort | uniq)

gem install bundler

for INSTALL_SCRIPT in ./scripts/install-*.sh
do
  bash "${INSTALL_SCRIPT}" -H
done

npm install -g @angular/cli

apt autoclean
apt autoremove -y
