#!/bin/bash

PACKAGE=telegram-desktop

if dpkg-query -W "${PACKAGE}"
then
	echo "${PACKAGE} is already installed";
else
	echo "${PACKAGE} installation";

	sudo snap install "${PACKAGE}"
fi
