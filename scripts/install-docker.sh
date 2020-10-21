#!/bin/bash

PACKAGE=docker-ce

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

	wget -qO- https://get.docker.com/ | sh
	sudo usermod -aG docker "${USER}"
	sudo apt install -y docker-compose
fi
