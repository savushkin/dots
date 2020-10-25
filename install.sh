#!/bin/bash

./scripts/packages.sh
./configure-packages.sh "${USER}"
./configure-sysctl.sh
./configure-symlinks.sh "$(realpath .)"
./configure-systemd.sh
