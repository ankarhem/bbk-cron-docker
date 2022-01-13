#!/bin/bash

set -xe

OUTPUT_FILE="/data/results.csv"
RESULTS="$(bbk_cli)"
COLUMN="$(echo "${RESULTS}" | awk -F ': ' '{print $2}')"
CLEANED="$(echo "${COLUMN}" | tr '\n' ';' | awk '{ gsub(/(;[ ]+)/,";"); print }' | awk '{ gsub(/( Mbit\/s)|( ms)/, ""); print }')"

echo $CLEANED >> $OUTPUT_FILE