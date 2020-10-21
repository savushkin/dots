#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

EXECUTABLE=polybar

if [ -f "/usr/local/bin/${EXECUTABLE}" ]
then
	echo "${EXECUTABLE} is already installed";
else
	echo "${EXECUTABLE} installation";

  apt update

  apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

  apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

  git clone -j$(nproc) https://github.com/polybar/polybar.git

  cd polybar || exit

  git checkout "$(git describe --tags)"
  git submodule update --init --recursive

  rm -rf build
  mkdir build
  cd build || exit
  cmake ..
  make -j$(nproc)
  sudo make install

fi
