#!/bin/bash

./install-packages.sh
./configure-packages.sh "${USER}"
./configure-symlinks.sh "$(realpath .)"

