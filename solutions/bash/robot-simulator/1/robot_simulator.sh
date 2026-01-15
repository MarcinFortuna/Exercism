#!/usr/bin/env bash

current_x="$1"
current_y="$2"
current_dir="$3"
instruction="$4"

# Early return for invalid values
if [[ ! "$current_dir" =~ ^(east|west|north|south){0,1}$ ]]; then
    echo "invalid direction"
    exit 1
elif [[ ! $instruction =~ ^[LRA]*$ ]]; then
    echo "invalid instruction"
    exit 1
fi

# Set default starting values if they are missing
[[ -z $current_x ]] && { current_x=0; }
[[ -z $current_y ]] && { current_y=0; }
[[ -z $current_dir ]] && { current_dir=north; }

# Exit with starting values if there are no instructions
[[ -z "$instruction" ]] && { echo "$current_x $current_y $current_dir"; exit; }

# Parse instructions

declare -a directions=(north east south west)

change_direction() {
    turn_direction="$1"
    
    # Find current direction idx
    for (( j=0; j<"${#directions[@]}"; j++ )); do
        if [[ "${directions[$j]}" == "$current_dir" ]]; then
            current_idx="$j";
            break;
        fi
    done

    # Find new direction idx
    if [[ "$turn_direction" == "R" ]]; then
        new_idx=$(( (current_idx + 1) % 4 ))
    else
        new_idx=$(( (current_idx + 3) % 4 ))
    fi

    # Assign new direction to var
    current_dir="${directions[$new_idx]}"
}

advance() {
    case "$current_dir" in
        "north") (( current_y++ )) ;;
        "east") (( current_x++ )) ;;
        "south") (( current_y-- )) ;;
        "west") (( current_x-- )) ;;
        *) echo "Error! Unknown direction."
            exit 1 ;;
    esac
}

for (( i=0; i < "${#instruction}"; i++ )); do
    if [[ "${instruction:$i:1}" =~ [LR] ]]; then
        change_direction "${instruction:$i:1}"
    else
        advance
    fi
done

echo "$current_x $current_y $current_dir"
