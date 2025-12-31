#!/usr/bin/env bash

usage_str="Usage: error_handling.sh <person>"

if [[ $# != 1 ]]; then
    echo $usage_str
    exit 1
fi

echo "Hello, "$1""
