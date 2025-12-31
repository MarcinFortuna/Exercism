#!/usr/bin/env bash

span=$1
slice_size=$2

if [[ -z $span ]]; then
    echo "series cannot be empty"
    exit 1
elif [[ $slice_size -gt ${#span} ]]; then
    echo "slice length cannot be greater than series length"
    exit 1
elif [[ $slice_size -eq 0 ]]; then
    echo "slice length cannot be zero"
    exit 1
elif [[ $slice_size -lt 0 ]]; then
    echo "slice length cannot be negative"
    exit 1
fi

slices=()

for (( i=0; i<${#span}-$slice_size+1; i++ )); do
    slices+=(${span:$i:$slice_size})
done

echo ${slices[@]}