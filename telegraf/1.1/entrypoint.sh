#!/bin/bash
set -e

if [ -n "$CONFIG_FILE" ]; then
    wget -O /etc/telegraf/telegraf.conf "$CONFIG_FILE"
fi

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
