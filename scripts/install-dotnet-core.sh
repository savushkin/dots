#!/bin/bash

PACKAGE=dotnet-sdk-6.0

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

  cd /tmp || exit
	wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
	sudo apt install -y /tmp/packages-microsoft-prod.deb
	rm -f /tmp/packages-microsoft-prod.deb

	sudo apt update
	sudo apt install -y "${PACKAGE}"
fi
