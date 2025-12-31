#!/usr/bin/env bash

if [[ $1 == "total" || ($1 > 0 && $1 < 65) ]]; then
    if [[ $1 == "total" ]]; then
        total=$(bc <<< "2^64 - 1")
        echo $total
    else
        result=$(( 2 ** ($1 - 1) ))
        echo ${result//-/}
    fi
else
    echo "Error: invalid input"
    exit 1
fi
