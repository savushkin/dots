#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

FONT=fonts-roboto

if dpkg-query -W "${FONT}"
then
	echo "${FONT} is already installed";
else
	echo "${FONT} installation";

	apt update
	apt install -y "${FONT}"
fi

FONT=fonts-font-awesome

if dpkg-query -W "${FONT}"
then
	echo "${FONT} is already installed";
else
	echo "${FONT} installation";

	apt update
	apt install -y "${FONT}"
fi

FONT=Iosevka

if [ $(fc-list "${FONT}" | wc -l) -ne 0 ]
then
	echo "${FONT} is already installed";
else
	echo "${FONT} installation";

	wget "https://github.com/be5invis/Iosevka/releases/download/v3.6.3/pkg-iosevka-3.6.3.zip"
	unzip -u pkg-iosevka-3.6.3.zip -d iosevka

  rm -f iosevka/*.css pkg-iosevka-3.6.3.zip
	mv iosevka /usr/share/fonts/

	fc-cache -fv
fi

FONT=JetBrainsMono

if [ $(fc-list "${FONT}" | wc -l) -ne 0 ]
then
	echo "${FONT} is already installed";
else
	echo "${FONT} installation";

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fi

ls -lah /etc/fonts/conf.d/70-*-bitmaps.conf

if [ -f /etc/fonts/conf.d/70-no-bitmaps.conf ]
then
	ln -s /etc/fonts/conf.avail/70-force-bitmaps.conf /etc/fonts/conf.d/
	unlink /etc/fonts/conf.d/70-no-bitmaps.conf
	dpkg-reconfigure fontconfig
fi
