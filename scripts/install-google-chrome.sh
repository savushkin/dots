#!/bin/bash

PACKAGE=google-chrome-stable

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

	echo "deb [arch=amd64] http://dl-ssl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

	sudo apt update
	sudo apt install -y "${PACKAGE}"
fi
