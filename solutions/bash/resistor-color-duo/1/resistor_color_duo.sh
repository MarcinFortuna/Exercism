#!/usr/bin/env bash

colors=(
    "black"
    "brown"
    "red"
    "orange"
    "yellow"
    "green"
    "blue"
    "violet"
    "grey"
    "white"
)

color_1=$1
color_2=$2

first_val=""
second_val=""

for (( i=0; i < 10; i++)); do
    if [[ ${colors[$i]} == $color_1 ]]; then
        first_val=$i
    fi
    if [[ ${colors[$i]} == $color_2 ]]; then
        second_val=$i
    fi
done

if [[ -z $first_val || -z $second_val ]]; then
    echo "invalid color"
    exit 1
fi

echo "${first_val/0/}${second_val}"
    

