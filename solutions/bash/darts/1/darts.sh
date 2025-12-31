#!/usr/bin/env bash

if [[ $# -ne 2 || ! $1 =~ ^-{0,1}[0-9\.]{1,}$ || ! $2 =~ ^-{0,1}[0-9\.]{1,}$ ]]; then
    echo "invalid args"
    exit 1
fi

coord_x="$1"
coord_y="$2"

calculate_dist() {
    local x="$1"
    local y="$2"
    # Pythagorean theorem
    bc -l <<< "sqrt($x*$x + $y*$y)"
}

dist=$(calculate_dist "$coord_x" "$coord_y")

if (( $(echo "$dist > 10" | bc -l) )); then
    echo "0"
elif (( $(echo "$dist > 5" | bc -l) )); then
    echo "1"
elif (( $(echo "$dist > 1" | bc -l) )); then
    echo "5"
elif (( $(echo "$dist <= 1" | bc -l) )); then
    echo "10"
else
    echo "ERROR!"
fi