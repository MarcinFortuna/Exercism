#!/usr/bin/env bash

if [[ "$#" -ne 1 || ! $1 =~ ^[0-9][0-9]?[0-9]?[0-9]?$ ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

if [[ $(($1 % 100)) == 0 ]]; then
    [[ $(($1 % 400)) == 0 ]] && echo "true" || echo "false"
else
    [[ $(($1 % 4)) == 0 ]] && echo "true" || echo "false"
fi
