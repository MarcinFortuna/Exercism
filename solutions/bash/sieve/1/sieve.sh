#!/usr/bin/env bash

max=$1

declare -A sequence=()

for (( i = 2; i<=max; i++)); do
    sequence[$i]="true"
done

num=2

while (( num * num <= $max )); do
    if [[ ${sequence[$num]} == "true" ]]; then
        for (( i=num+num; i <= max; i+=num )); do
            sequence[$i]="false"
        done
    fi
    ((num++))
done

output=""

for el in "${!sequence[@]}"; do
    [[ ${sequence[$el]} == true ]] && output+="${el} "
done

echo $output | tr " " "\n" | sort -n | grep . | tr "\n" " " | xargs