#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

add-apt-repository -y ppa:graphics-drivers/ppa
apt update
apt install --no-install-recommends --yes nvidia-driver-510
apt install --yes nvidia-settings
