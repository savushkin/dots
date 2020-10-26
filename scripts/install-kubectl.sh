#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

EXECUTABLE=kubectl
DIR="/opt/kubectl"

if [ -f "/usr/local/bin/${EXECUTABLE}" ]
then
	echo "${EXECUTABLE} is already installed";
else
	echo "${EXECUTABLE} installation";

  rm -rf "${DIR}"
  mkdir -p "${DIR}"
  cd "${DIR}" || exit

  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

  chmod a+x "${DIR}/${EXECUTABLE}"

  ln -s "${DIR}/${EXECUTABLE}" "/usr/local/bin/${EXECUTABLE}"
fi
