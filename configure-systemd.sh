#!/bin/bash

systemctl --user daemon-reload
systemctl --user enable \
i3wm.service \
compton.service \
setxkbmap.service \
polybar.service \
theming.service \
wallpaper.service \
tray.target \
network-manager-applet.service \
blueman-applet.service \
udiskie.service \
telegram-desktop.service \
jetbrains-toolbox.service
