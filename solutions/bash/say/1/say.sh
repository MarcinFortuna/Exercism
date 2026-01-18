#!/usr/bin/env bash

[[ $1 -lt 0 || $1 -gt 999999999999 ]] && { echo "input out of range"; exit 1 ; }

number="$1"

basic=(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
tens=("" "" twenty thirty forty fifty sixty seventy eighty ninety)

threes=($(echo $number | rev | fold -w3 | rev))
threes_len="${#threes[@]}"

parse_a_three() {
    local num="$1"
    # String-based compa
    if [[ "$num" == "000" ]]; then
        echo -n "";
    elif [[ "$num" == "0" ]]; then
        echo -n "zero"
    else
        num=$(( num + 0 )) # To get rid of leading zeros for further calculation
        local output=""
        if [[ $num -gt 99 ]]; then
            hundred_pos="${basic[${num:0:1}]}"
            output+=" $hundred_pos hundred"
            num="${num:1}"
        fi
        if [[ $num -gt 19 ]]; then
            ten_pos="${tens[${num:0:1}]}"
            output+=" $ten_pos"
            if [[ ${num:1} -gt 0 ]]; then
                ones_pos="${basic[${num:1}]}"
                output+="-$ones_pos"
            fi
        elif [[ $num -gt 0 ]]; then
            output+=" ${basic[$num]}"
        fi
        echo "$output"
    fi
}

final_output=""

for (( i=$threes_len-1; i>=0; i-- )); do
    string_fragment=$(parse_a_three "${threes[$i]}")
    final_output+="$string_fragment"
    [[ $i -eq 1 && "${#string_fragment}" -gt 0 ]] && final_output+=" thousand"
    [[ $i -eq 2 && "${#string_fragment}" -gt 0 ]] && final_output+=" million"
    [[ $i -eq 3 && "${#string_fragment}" -gt 0 ]] && final_output+=" billion"
done

echo $final_output
    