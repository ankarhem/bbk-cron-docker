#!/bin/sh

set -xe

results="$(bbk_cli | awk -F ': ' '{print $2}' | awk '{ gsub(/^[ \n]+/,""); print $1}')"

for line in $results
do
  printf "$line;" >> /results.csv
done

printf "\n" >> /results.csv
