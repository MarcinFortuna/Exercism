#!/usr/bin/env bash

num=$1

left_bound=0
right_bound=$(( $num + 1 ))

while (( left_bound != right_bound - 1 )); do
    midpoint=$(( (left_bound + right_bound ) /2 ))
    if (( midpoint * midpoint <= num )); then
        left_bound=$midpoint
    else
        right_bound=$midpoint
    fi
done

echo $left_bound