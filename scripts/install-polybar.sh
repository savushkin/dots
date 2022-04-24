#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

EXECUTABLE=polybar
DIR="/opt/polybar"

if [ -f "/usr/local/bin/${EXECUTABLE}" ]
then
	echo "${EXECUTABLE} is already installed";
else
	echo "${EXECUTABLE} installation";

  apt update

  apt install -y \
    build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
    libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev libuv1 libuv1-dev

  git clone -j "$(nproc)" https://github.com/polybar/polybar.git "${DIR}"

  cd "${DIR}" || exit

  git checkout "$(git describe --tags)"
  git submodule update --init --recursive

  rm -rf "${DIR}/build"
  mkdir "${DIR}/build"
  cd "${DIR}/build" || exit
  cmake "${DIR}"
  make -j "$(nproc)"
  sudo make install

fi
