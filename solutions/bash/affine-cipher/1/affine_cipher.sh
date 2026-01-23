#!/usr/bin/env bash

main() {
    mode="$1"
    num_a="$2"
    num_b="$3"
    txt=$(echo "${4,,}" | tr -d "[:punct:] ")
    
    # Early return for non-coprimes
    coprimes=$(check_coprime "$num_a" 26)
    [[ "$coprimes" == "false" ]] && { echo "a and m must be coprime."; exit 1; }

    # Check the mode
    if [[ "$mode" == "encode" || "$mode" == "decode" ]]; then
        encode_decode "$num_a" "$num_b" "$txt" "$mode"
    else
        echo "Invalid mode!"
        exit 1
    fi
}

alphabet=$(echo {a..z} | tr -d " ")

find_idx() {
    local char="$1"
    for (( i=0; i<26; i++ )); do
        if [[ "$char" == "${alphabet:$i:1}" ]]; then
            echo "$i"
            return
        fi
    done
    # If not found: not alphabetic
    echo "ERROR! Character $char is non-alphabetic"
    exit 1
}

encode_decode() {
    local num_a="$1"
    local num_b="$2"
    local txt="$3"
    local mode="$4"
    local output=""
    for (( i=0; i<"${#txt}"; i++ )); do
        local char="${txt:$i:1}"
        if [[ "$char" =~ [0-9] ]]; then
            output+="$char"
        else
            idx=$(find_idx "$char")
            if [[ $mode == "encode" ]]; then
                new_idx=$(( (num_a * idx + num_b) % 26 ))
            else
                mmi=$(get_mmi "$num_a" 26)
                new_idx=$(( (mmi * (idx - num_b)) % 26 ))
            fi
            output+="${alphabet:$new_idx:1}"
        fi
    done
    if [[ $mode == "encode" ]]; then
        echo "$output" | fold -w 5 | tr "\n" " " | xargs
    else
        echo "$output"
    fi
}

check_coprime() {
    num1="$1"
    num2="$2"
    smaller=$(echo -e "$num1\n$num2" | sort -n | head -1)
    d=2
    while (( d <= smaller )); do
        if (( num1 % d == 0 )) && (( num2 % d == 0 )); then
            echo "false"
            return
        fi
        ((d++))
    done
    echo "true"
}

get_mmi() {
    local a="$1"
    local m="$2"

    # MMI exists only if two numbers are coprime
    # If they are not, throw an error
    coprimes=$(check_coprime "$a" "$m")
    [[ "$coprimes" == "false" ]] && { echo "ERROR! $a and $m are not coprimes. There is no MMI."; exit 1; }

    local i=2
    
    while (( (a * i) % m != 1 )); do
      (( i++ ))
    done
    echo "$i"
}

main "$@"