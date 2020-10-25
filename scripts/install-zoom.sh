#!/bin/bash

PACKAGE=zoom

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

  cd /tmp || exit
	wget https://zoom.us/client/latest/zoom_amd64.deb
	sudo apt install -y /tmp/zoom_amd64.deb
	rm -f /tmp/zoom_amd64.deb
fi
