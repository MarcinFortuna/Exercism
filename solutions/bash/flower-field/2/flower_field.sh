#!/usr/bin/env bash

input=("$@")

declare -A indices_with_values=()

# Function to calculate flowers in neighboring cells
count_from_coords() {
    coords="$1" # Format: "$i,$j"
    row=$(echo "$coords" | cut -d, -f1)
    col=$(echo "$coords" | cut -d, -f2)
    counter=0
    for ((dr=-1; dr<=1; dr++)); do
        for ((dc=-1; dc<=1; dc++)); do
            [[ $dr -eq 0 && $dc -eq 0 ]] && continue        
            neighbor_row=$((row + dr))
            neighbor_col=$((col + dc))
            if [[ ${indices_with_values["$neighbor_row,$neighbor_col"]} == "*" ]]; then
                ((counter++))
            fi
        done
    done
    echo $counter;
}

# Step 1: Populate an associative array with indices and values to simulate a 2d array
for (( i=0; i<"${#input[@]}"; i++)); do
    for (( j=0; j<"${#input[$i]}"; j++ )); do
        indices_with_values["$i,$j"]="${input[$i]:$j:1}"
    done
done

# Step 2: Replace spaces in the associative array with counts
for key in "${!indices_with_values[@]}"; do
    if [[ "${indices_with_values[$key]}" == " " ]]; then
        value=$(count_from_coords "$key")
        indices_with_values[$key]="$value"
    fi
done

# Step 3: Reassemble the strings
for (( i=0; i<"${#input[@]}"; i++)); do
    for (( j=0; j<"${#input[$i]}"; j++ )); do
        value_to_insert="${indices_with_values["$i,$j"]}"
        if [[ "$value_to_insert" =~ [0-9]{1,} && "$value_to_insert" -gt 0 ]]; then
            input[$i]=$(echo "${input[$i]}" | sed -e "s/./$value_to_insert/$((j+1))")
        fi
    done
done

# Step 4: Output
for (( i=0; i<"${#input[@]}"; i++)); do
    echo "${input[$i]}"
done