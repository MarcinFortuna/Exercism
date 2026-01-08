#!/usr/bin/env bash

size=$1

[[ $size -eq 0 ]] && { exit; }

generate_row() {
    previous_row=($1)
    output="1"

    for (( i = 1; i<${#previous_row[@]}; i++)) {
        output+=" "
        output+=$(( previous_row[i] + previous_row[i-1] ))
    }
    [[ ${#previous_row[@]} -gt 0 ]] && output+=" 1"
    
    spaces_no=$(( size - ${#previous_row[@]} - 1 ))
    echo "$(printf %${spaces_no}s)$output"
}

row=""

for (( i=1; i<=size; i++ )); do
    row=$(generate_row "$row")
    echo "$row"
done
