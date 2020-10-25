#!/bin/bash

./scripts/packages.sh
./configure-packages.sh "${USER}"
./configure-symlinks.sh "$(realpath .)"
./configure-systemd.sh
