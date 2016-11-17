#!/bin/bash
set -e

if [ -n "$CONFIG_FILE" ]; then
    wget -O /tmp/telegraf.conf "$CONFIG_FILE"
else
    wget -O /tmp/telegraf.conf "https://raw.githubusercontent.com/anantasty/influxdata-docker/master/telegraf/1.1/telegraf.conf"
fi
mo /tmp/telegraf.conf > /etc/telegraf/telegraf.conf

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
