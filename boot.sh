#!/bin/sh

set -xe

FILE="/data/results.csv"

if ! test -f $FILE; then
    echo "Results file not found. Downloading it..."
    curl -o $FILE https://raw.githubusercontent.com/ankarhem/bbk-cron-docker/master/results.csv
fi

cron && tail -f /var/log/cron.log