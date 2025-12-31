#!/usr/bin/env bash

name=$1
num=$2

generate_greeting() {
    echo "$1, you are the $2 customer we serve today. Thank you!"
}

ordinal=$num

if [[ $num =~ ([0|4-9]|1[1-3])$ ]]; then
    ordinal+="th"
elif [[ $num =~ 1$ ]]; then
    ordinal+="st"
elif [[ $num =~ 2$ ]]; then
    ordinal+="nd"
elif [[ $num =~ 3$ ]]; then
    ordinal+="rd"
else
    echo "REGEX ERROR!"
    exit 1
fi

generate_greeting $name $ordinal
