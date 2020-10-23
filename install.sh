#!/bin/bash

./install-packages.sh
./configure-packages.sh "${USER}"
./configure-symlinks.sh "$(realpath .)"

systemctl --user enable i3wm.service
