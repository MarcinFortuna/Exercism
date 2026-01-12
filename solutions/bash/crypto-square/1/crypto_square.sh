#!/usr/bin/env bash

# Stage 1: Normalization
normalized=$(echo "${1,,}" | tr -cd "[:alnum:]")

(( ${#normalized} < 2 )) && { echo "$normalized"; exit; }

# Stage 2: Calculate target rectangle size
row_number=$(bc <<< "scale=0; sqrt(${#normalized})")

if (( row_number ** 2 == ${#normalized} )); then
    column_number=$row_number
else
    column_number=$(( row_number + 1 ))
    (( column_number * row_number < ${#normalized} )) && ((row_number++))
fi

# Stage 3: Transpose
input=($(echo -n $normalized | fold -w $column_number | tr "\n" " "))
output=""

for (( i=0; i<column_number; i++ )); do
    for el in "${input[@]}"; do
        if [[ -z ${el:$i:1} ]]; then
            output+=" "
        else
            output+=${el:$i:1}
        fi
    done
done

echo -n "$output" | fold -w $row_number | tr "\n" " "