#!/usr/bin/env bash

echo "${1,,}" | tr -cs "[[:alnum:]]'" "\n" | sed -e "s/\(^'\|'$\)//g" | sort | grep . | uniq -c | sed -e 's/^[[:space:]]*\([0-9]\+\)[[:space:]]\+\(.*\)$/\2: \1/'