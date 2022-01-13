#!/bin/sh

set -xe

OUTPUT_FILE="/data/results.csv"
RESULTS="$(bbk_cli | awk -F ': ' '{print $2}' | awk '{ gsub(/^[ \n]+/,""); print $1}')"

for line in $RESULTS
do
  printf "$line;" >> $OUTPUT_FILE
done

printf "\n" >> $OUTPUT_FILE