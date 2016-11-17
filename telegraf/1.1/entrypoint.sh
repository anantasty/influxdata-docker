#!/bin/bash
set -e

if [ -n "$CONFIG_FILE" ]; then
    wget -O /tmp/telegraf.conf "$CONFIG_FILE"
    mo /tmp/telegraf.conf > /etc/telegraf/telegraf.conf
fi

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
