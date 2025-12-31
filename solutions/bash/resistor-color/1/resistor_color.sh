#!/usr/bin/env bash

resistors=(
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
)

mode=$1

if [[ ! $mode =~ ^code|colors$ ]]; then
    echo "Usage: resistor_color.sh code <color> OR resistor_color.sh colors"
    exit 1
elif [[ $mode == "code" ]]; then
    color=$2
    if [[ -z $color ]]; then
        echo "Usage: resistor_color.sh code <color> OR resistor_color.sh colors"
        exit 1
    fi
    for (( i=0; i < 10; i++ )); do
        if [[ "${resistors[$i]}" =~ $color ]]; then
            echo $i
        fi
    done
elif [[ $mode == "colors" ]]; then
    for color in "${resistors[@]}"; do
        echo ${color/,/}
    done
fi

