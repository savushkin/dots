#!/bin/bash

systemctl --user daemon-reload
systemctl --user enable \
i3wm.service \
compton.service \
polybar.service \
theming.service \
wallpaper.service \
tray.target
