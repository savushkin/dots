#!/bin/bash

PACKAGE=skypeforlinux

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

  cd /tmp || exit
	wget https://go.skype.com/skypeforlinux-64.deb
	sudo apt install -y /tmp/skypeforlinux-64.deb
	rm -f /tmp/skypeforlinux-64.deb
fi
