#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

INOTIFY_RULE='fs.inotify.max_user_watches = 524288'

if grep "${INOTIFY_RULE}" /etc/sysctl.conf
then
  echo "${INOTIFY_RULE} founded"
else
  echo -e "\n${INOTIFY_RULE}\n" >> /etc/sysctl.conf
  sysctl -p --system
fi
