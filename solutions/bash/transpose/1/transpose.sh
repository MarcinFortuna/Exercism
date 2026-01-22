#!/usr/bin/env bash

input=$(cat)
[[ -z "$input" ]] && { exit; }

longest_width=$(echo "$input" | wc -L)
declare -a output_arr=()

while read -r line; do
    for (( i=0; i<$longest_width; i++ )); do
        char="${line:$i:1}"
        [[ -z $char ]] && char=" "
        output_arr[$i]="${output_arr[$i]}${char}"
    done
done <<< $input

# Trim only unnecessary spacing.
# Identify last line whitespace; measure amount of added whitespace

line_edge_whitespace=$(echo "${output_arr[$((longest_width - 1))]}" | grep -Eo "\s+$")
whitespace_length="${#line_edge_whitespace}"

# In the last row all whitespace can be safely trimmed
output_arr[$((longest_width - 1))]=$(echo "${output_arr[$((longest_width - 1))]}" | sed -E "s/\s{$whitespace_length}$//")

for (( i=${#output_arr[@]}-2; i>=0; i-- )); do
    # Measure the right edge whitespace of all lines from the end
    line_edge_whitespace=$(echo "${output_arr[$i]}" | grep -Eo "\s+$")
    # Never trim more than was trimmed before
    if [[ "${#line_edge_whitespace}" -lt "$whitespace_length" ]]; then
        whitespace_length="${#line_edge_whitespace}"
    fi
    output_arr[$i]=$(echo "${output_arr[$i]}" | sed -E "s/\s{$whitespace_length}$//")
    if [[ $whitespace_length -eq 0 ]]; then
        break;
    fi
done

for row in "${output_arr[@]}"; do
    echo "$row"
done
