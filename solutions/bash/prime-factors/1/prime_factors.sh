#!/usr/bin/env bash

arg=$1

i=2

factors=()

while (( i * i <= arg )); do
    if (( arg % i > 0 )); then
        (( i++ ))
    else
        (( arg /= i ))
        factors+=("$i")
    fi
done

if [[ $arg -gt 1 ]]; then
    factors+=("$arg")
fi

echo ${factors[@]}
