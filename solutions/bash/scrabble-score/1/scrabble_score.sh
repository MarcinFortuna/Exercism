#!/usr/bin/env bash

declare -A scrabble_values=(
    [AEIOULNRST]="1"
    [DG]="2"
    [BCMP]="3"
    [FHVWY]="4"    
    [K]="5"
    [JX]="8"
    [QZ]="10"
)

word=${1^^}

score=0

for (( i=0; i < ${#word}; i++ )); do
    for key in "${!scrabble_values[@]}"; do
        [[ "$key" =~ ${word:$i:1} ]] && (( score+=${scrabble_values[$key]} )) && break;
    done
done 

echo $score