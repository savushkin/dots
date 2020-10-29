#!/bin/bash

MONITORS=$(xrandr -q | grep -w connected | cut -d ' ' -f 1)
PRIMARY_MONITOR=$(xrandr -q | grep -w primary | cut -d ' ' -f 1)

for MONITOR in ${MONITORS}
do
    if [ "${PRIMARY_MONITOR}" == "${MONITOR}" ]
    then
        echo "Start polybar-top-tray@${MONITOR}"
        systemctl --user start "polybar-top-tray@${MONITOR}.service"
    else
        echo "Start polybar-top@${MONITOR}"
        systemctl --user start "polybar-top@${MONITOR}.service"
    fi

    echo "Start polybar-bottom@${MONITOR}"
    systemctl --user start "polybar-bottom@${MONITOR}.service"
done
