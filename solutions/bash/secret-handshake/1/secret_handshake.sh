#!/usr/bin/env bash

binary=$(echo "obase=2;$1" | bc)

if [[ ${#binary} -gt 5 ]]; then
    binary=${binary: -5:5}
else
    #Pad with zeros do assure stable indexing
    binary=$(printf %05d $binary)
fi

actions=()

(( ${binary:4:1} == "1" )) && actions+=("wink")
(( ${binary:3:1} == "1" )) && actions+=("double blink")
(( ${binary:2:1} == "1" )) && actions+=("close your eyes")
(( ${binary:1:1} == "1" )) && actions+=("jump")

output=""

if (( ${binary:0:1} == "1" )); then
    for ((i=${#actions[@]}-1; i>=0; i--)); do
        output+=${actions[$i]}
        (( i > 0 )) && output+=","
    done
else
    for ((i=0; i<"${#actions[@]}"; i++)); do
        output+=${actions[$i]}
        (( i != ${#actions[@]} -1 )) && output+=","
    done
fi

echo $output

