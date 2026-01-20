#!/usr/bin/env bash

while getopts "k:" opt; do
	case $opt in
		k) key=$OPTARG ;; 
		\?) echo "Invalid option: -$OPTARG" >&2 exit 1 ;;
	esac
done

if [[ -n $key && ! $key =~ ^[a-z]{1,}$ ]]; then
    echo "invalid key"
    exit 1
fi

shift $((OPTIND -1))

mode="$1"
input="${2,,}"
key_length="${#key}"

alphabet=$(echo {a..z} | tr -d " ")

get_idx_from_letter() {
    for (( l=0; l<26; l++ )); do
        if [[ "$1" == "${alphabet:$l:1}" ]]; then
            echo "$l"
            break
        fi
    done
}

generate_key() {
    output=""
    for (( i=0; i < 100; i++ )) {
        ran=$(( RANDOM % 26 ))
        output+="${alphabet:$ran:1}"
    }
    echo "$output"
}

encode_decode() {
    output=""
    for (( i=0; i<"${#input}"; i++ )); do
        char="${input:$i:1}"
        if [[ ! "$char" =~ [a-z] ]]; then
            output+="$char"
        else
            # Find char idx in the key
            key_idx=$(( i % key_length ))
            # Find its alphabetic idx
            shift_idx=$(get_idx_from_letter "${key:$key_idx:1}")
            # Find current char alphabet idx
            for (( j=0; j<26; j++ )); do
                if [[ "$char" == "${alphabet:$j:1}" ]]; then
                    current_idx="$j"
                    break
                fi
            done
            # Find new idx
            if [[ "$1" == "E" ]]; then
                # Encode: add to current_idx
                new_idx=$(( (current_idx + shift_idx) % 26 ))
            elif [[ "$1" == "D" ]]; then
                # Decode: subtract from current_idx
                new_idx=$(( (current_idx - shift_idx) % 26 ))
            fi
            output+="${alphabet:$new_idx:1}"
        fi
    done
    echo "$output"
}

if [[ $mode == "key" ]]; then
    generate_key
elif [[ $mode == "encode" ]]; then
    encode_decode "E"
elif [[ $mode == "decode" ]]; then
    encode_decode "D"
else
    echo "Incorrect mode!"
    exit 1
fi