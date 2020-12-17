#!/bin/bash

PACKAGE=discord

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

  cd /tmp || exit
	wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo apt install -y /tmp/discord.deb
	rm -f /tmp/discord.deb
fi
