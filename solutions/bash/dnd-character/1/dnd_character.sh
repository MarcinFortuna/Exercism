#!/usr/bin/env bash

mode=$1
num=$2

usage_instruction="usage: dnd_character.sh modifier n
-> output expected modifier
 usage: dnd_character.sh generate
-> output each characteristic and ability value, one per line"

if [[ $# -lt 1 || $# -gt 2 || ! $mode =~ generate|modifier || ( $mode == "generate" && ! -z $num ) || ( $mode == "modifier" && ! $num =~ ^[0-9]{1,}$ ) ]]; then
    echo $usage_instruction
fi

generate_random_dice_rolls() {
    no_dice=$1
    no_output=$2
    results=()
    # Throw dice
    for i in seq 1 $no_dice; do
        random_result=$((($RANDOM % 6) + 1))
        results+=($random_result)
    done
    # Sort results; discard the worst ones; generate string with pluses
    results=$(echo ${results[*]} | tr -d " " | fold -w1 | sort -nr | head -n $no_output | tr "\n" "+" | sed s/\+$//)
    # String with pluses gets summed in bc
    echo $results | bc
}

calculate_modifier() {
    result=$(echo "scale=1; ($1 - 10) / 2" | bc -l )
    if [[ $result =~ \.5 ]]; then
        result=$(echo "$result - 0.5" | bc)
    fi
    result=$(echo "scale=0; $result / 1" | bc)
    echo $result
}


if [[ $mode == "generate" ]]; then
    initial_strength=$(generate_random_dice_rolls 4 3)
    initial_dexterity=$(generate_random_dice_rolls 4 3)
    initial_constitution=$(generate_random_dice_rolls 4 3)
    initial_intelligence=$(generate_random_dice_rolls 4 3)
    initial_wisdom=$(generate_random_dice_rolls 4 3)
    initial_charisma=$(generate_random_dice_rolls 4 3)
    const_modifier=$(calculate_modifier $initial_constitution)
    hitpoints=$((const_modifier + 10))

    echo "strength $initial_strength"
    echo "dexterity $initial_dexterity"
    echo "constitution $initial_constitution"
    echo "intelligence $initial_intelligence"
    echo "wisdom $initial_wisdom"
    echo "charisma $initial_charisma"
    echo "hitpoints $hitpoints"
elif [[ $mode == "modifier" ]]; then
    calculate_modifier $num
fi
