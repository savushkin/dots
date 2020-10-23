#!/bin/bash

./scripts/install-packages.sh
./scripts/configure-packages.sh "${USER}"
./scripts/configure-symlinks.sh "$(realpath .)"

