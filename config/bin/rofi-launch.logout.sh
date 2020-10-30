#!/bin/bash

SUSPEND='Suspend'
LOCK_SCREEN='Lock screen'
LOGOUT='Logout'
REBOOT='Reboot'
HIBERNATE='Hibernate'
POWER_OFF='Power off'

option=$(echo -e "${SUSPEND}\n${LOCK_SCREEN}\n${LOGOUT}\n${REBOOT}\n${HIBERNATE}\n${POWER_OFF}" | rofi -width 600 -dmenu -p system)
case $option in
    "${SUSPEND}")
        /usr/bin/systemctl syspend
        ;;
    "${LOCK_SCREEN}")
        "${HOME}/.config/bin/lock-screen.sh"
        ;;
    "${LOGOUT}")
        /usr/bin/systemctl --user stop wm.target
        ;;
    "${REBOOT}")
        /usr/bin/systemctl reboot
        ;;
    "${HIBERNATE}")
        /usr/bin/systemctl hibernate
        ;;
    "${POWER_OFF}")
        /usr/bin/systemctl poweroff
        ;;
esac
