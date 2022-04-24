#!/bin/bash

PACKAGE=nodejs

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

	curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

	sudo apt update
	sudo apt install -y "${PACKAGE}"
fi
