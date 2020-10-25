#!/bin/bash

./scripts/packages.sh "${USER}"
./configure-packages.sh "${USER}"
./configure-sysctl.sh
./configure-symlinks.sh "$(realpath .)"
./configure-systemd.sh
