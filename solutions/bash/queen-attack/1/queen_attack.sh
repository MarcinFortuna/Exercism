#!/usr/bin/env bash

while getopts "b:w:" arg; do
    case $arg in
        b)  black_pos=$OPTARG
            ;;
        w)  white_pos=$OPTARG
            ;;
        *) echo "Usage: queen_attack.sh -w <n,n> -b <n,n>"
            ;;
    esac
done

black_pos=(${black_pos/,/ })
white_pos=(${white_pos/,/ })

if [[ ${black_pos[0]} -lt 0 || ${white_pos[0]} -lt 0 ]]; then
    echo "row not positive"
    exit 1
elif [[ ${black_pos[0]} -gt 7 || ${white_pos[0]} -gt 7 ]]; then
    echo "row not on board"
    exit 1
elif [[ ${black_pos[1]} -lt 0 || ${white_pos[1]} -lt 0 ]]; then
    echo "column not positive"
    exit 1
elif [[ ${black_pos[1]} -gt 7 || ${white_pos[1]} -gt 7 ]]; then
    echo "column not on board"
    exit 1
elif [[ ${black_pos[0]} == ${white_pos[0]} && ${black_pos[1]} == ${white_pos[1]} ]]; then
    echo "same position"
    exit 1
elif [[ ${black_pos[0]} == ${white_pos[0]} && ${black_pos[1]} != ${white_pos[1]} ]]; then
    echo "true"
elif [[ ${black_pos[0]} != ${white_pos[0]} && ${black_pos[1]} == ${white_pos[1]} ]]; then
    echo "true"
else
    dist_1=$(( ${white_pos[0]} - ${black_pos[0]} ))
    dist_2=$(( ${white_pos[1]} - ${black_pos[1]} ))
    (( ${dist_1#-} == ${dist_2#-} )) && echo "true" || echo "false"
fi