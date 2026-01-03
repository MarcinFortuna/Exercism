#!/usr/bin/env bash

target=$1; shift
list=("$@")

if [[ ${#list[@]} == 0 || ${list[0]} -gt $target || ${list[$((${#list[@]} - 1))]} -lt $target ]]; then
    echo "-1"
    exit
fi

lower_bound=0
upper_bound=$(( ${#list[@]} - 1 ))

while [[ $lower_bound -le $upper_bound ]]; do
    mid=$(( lower_bound + ( upper_bound - lower_bound ) / 2 ))

    if [[ ${list[$mid]} -eq "$target" ]]; then
        echo $mid
        exit
    fi
    
    if [[ ${list[$mid]} -lt "$target" ]]; then
        lower_bound=$(( mid + 1 ))
    else
        upper_bound=$(( mid - 1 ))
    fi
done

echo "-1"