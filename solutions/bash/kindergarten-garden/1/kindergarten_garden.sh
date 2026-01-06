#!/usr/bin/env bash

row1=$(echo "$1" | head -n 1)
row2=$(echo "$1" | tail -n 1)
target_kid=$2

[[ ${#row1} -ne ${#row2} ]] && { echo "ERROR! Rows are not equal."; exit 1; }

declare -a kids=(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
declare -A plants=([G]=grass [C]=clover [R]=radishes [V]=violets)

for (( i=0; i<"${#kids[@]}"; i++ )); do
    if [[ "${kids[$i]}" == $target_kid ]]; then
        target_idx=$i
        break
    fi
done

row_idx=$(( target_idx * 2 ))
searched_plants="${row1:$row_idx:2}${row2:$row_idx:2}"

output=""

for (( i=0; i<"${#searched_plants}"; i++ )); do
    output+="${plants[${searched_plants:$i:1}]} "
done

echo $output;