#!/bin/bash

SUSPEND='Suspend'
LOCK_SCREEN='Lock screen'
LOGOUT='Logout'
REBOOT='Reboot'
POWER_OFF='Power off'

option=$(echo -e "${SUSPEND}\n${LOCK_SCREEN}\n${LOGOUT}\n${REBOOT}\n${POWER_OFF}" | rofi -width 600 -dmenu -p system)
case $option in
    "${SUSPEND}")
        sudo  /usr/bin/systemctl syspend
        ;;
    "${LOCK_SCREEN}")
        "${HOME}/.config/bin/lock-screen.sh"
        ;;
    "${LOGOUT}")
        i3-nagbar -t warning -m 'Are you sure you  want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'
        ;;
    "${REBOOT}")
        /usr/bin/systemctl reboot
        ;;
    "${POWER_OFF}")
        /usr/bin/systemctl poweroff
        ;;
esac
