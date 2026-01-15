#!/usr/bin/env bash

[[ "$#" -ne 2 ]] && { echo "2 arguments expected"; exit 1; }
[[ "$1" -gt "$2" ]] && { echo "Start must be less than or equal to End"; exit 1; }

start="$1"
end="$2"

song_start="I know an old lady who swallowed a "
verse_8="horse.
She's dead, of course!"
animals=(fly spider bird cat dog goat cow)
animal_comment=("" "It wriggled and jiggled and tickled inside her." "How absurd to swallow a bird!" "Imagine that, to swallow a cat!" "What a hog, to swallow a dog!" "Just opened her throat and swallowed a goat!" "I don't know how she swallowed a cow!")
fly_verse="I don't know why she swallowed the fly. Perhaps she'll die."

swallow_to() {
    output="She swallowed the $1 to catch the "
    if [[ $2 == "spider" ]]; then
        output+="spider that wriggled and jiggled and tickled inside her."
    else
        output+="$2."
    fi
    echo "$output"
}

generate_verse() {
    verse="$1"
    if [[ $verse -eq 8 ]]; then
        echo "$song_start$verse_8"
    else
        idx=$(( verse - 1 ))
        echo "$song_start${animals[$idx]}."
        if [[ ! -z "${animal_comment[$idx]}" ]];
            then echo "${animal_comment[$idx]}"
        fi
        for (( j=$idx; j>=1; j-- )); do
            swallow_to ${animals[$j]} ${animals[$(( j - 1 ))]}
        done
        echo "$fly_verse"
    fi
}

for v in `seq $start $end`; do
    generate_verse $v
    echo
done