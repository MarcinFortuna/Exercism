#!/usr/bin/env bash

if [[ $# != 2 || $1 > $2 || $1 -lt 1 || $2 -lt 1 || $1 -gt 12 || $2 -gt 12 ]]; then
    echo "Arguments invalid. Usage: <First verse> <Last verse>. Range: 1-12"
    exit 1
fi

start_prefix="This is "
that_prefixes=("that lay in " "that ate " "that killed " "that worried " "that tossed " "that milked " "that kissed " "that married " "that woke " "that kept " "that belonged to " "")
objects=("the house that Jack built." "the malt" "the rat" "the cat" "the dog" "the cow with the crumpled horn" "the maiden all forlorn" "the man all tattered and torn" "the priest all shaven and shorn" "the rooster that crowed in the morn" "the farmer sowing his corn" "the horse and the hound and the horn")

generate_verse() {
    for ((i=$1-1; i>=0; i--)); do
        local line=""
        if [[ $i -eq $1-1 ]]; then
            line+="$start_prefix"
        else
            line+="${that_prefixes[i]}"
        fi
        line+="${objects[i]}"
        echo -e "$line"
    done
}

for (( v=$1; v<=$2; v++)); do
    if [[ v -gt $1 ]]; then printf "\n"; fi
    generate_verse v
done