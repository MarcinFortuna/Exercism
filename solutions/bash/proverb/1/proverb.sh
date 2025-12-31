#!/usr/bin/env bash

items=("$@")

for (( i=0; i < ${#items[@]}; i++ )); do
    if (( i == ${#items[@]} - 1 )); then
        echo -n "And all for the want of a "${items[0]}"."
    else
        echo "For want of a ${items[i]} the ${items[i+1]} was lost."
    fi
done