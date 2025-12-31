#!/usr/bin/env bash

if [[ "$#" -ne 2 && "$#" -ne 4 ]]; then
    echo "invalid arguments"
    exit 1
elif [[ ! -z $3 && $3 != "+" && $3 != "-" ]]; then
    echo "invalid arguments"
    exit 1
elif [[ ! $1 =~ ^-*[0-9]{1,}$ || ! $2 =~ ^-*[0-9]{1,}$ || ( ! -z $4 && ! $4 =~ ^[0-9]{1,}$ ) ]]; then
    echo "invalid arguments"
    exit 1
fi

input_hours=$1
input_minutes=$2
operation=$3
minutes_to_modify=$4

if [[ $operation == "+" ]]; then
    ((input_minutes += minutes_to_modify))
elif [[ $operation == "-" ]]; then
    ((input_minutes -= minutes_to_modify))
fi

hours_from_minutes=$(($input_minutes / 60))
remaining_minutes=$(($input_minutes % 60))

if [[ $remaining_minutes -lt 0 ]]; then
    ((hours_from_minutes--))
    ((remaining_minutes+=60))
fi

hours_to_display=$(( ($input_hours + $hours_from_minutes) % 24 ))

if [[ $hours_to_display -lt 0 ]]; then
    ((hours_to_display+=24))
fi

printf "%02d:%02d" $hours_to_display $remaining_minutes