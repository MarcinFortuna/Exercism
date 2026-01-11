#!/usr/bin/env bash

while getopts "nlivx" opt; do
    case $opt in
        n) line_no=true ;;
        l) only_names=true ;;
        i) case_insensitive=true ;;
        v) invert=true ;;
        x) whole_lines=true ;;
        \?) echo "Invalid option: -$OPTARG"; exit 1 ;;
    esac
done

shift $((OPTIND -1))
pattern="$1"
shift 
files=("$@")

[[ $case_insensitive == "true" ]] && { shopt -s nocasematch; }
[[ $whole_lines == "true" ]] && { pattern="^$pattern$"; }

file_names_to_print=()

perform_search() {
    pattern="$1"
    path="$2"
    line_counter=0
    while read line; do
        ((line_counter++))
        if [[ "$line" =~ $pattern && "$invert" != "true" ]] || [[ ! "$line" =~ $pattern && "$invert" == "true" ]]; then
          if [[ $only_names == "true" ]]; then
              file_names_to_print+=("$path")
          else
              output=""
              if [[ "${#files[@]}" -gt 1 ]]; then
                  output+="${path}:"
              fi
              if [[ $line_no == "true" ]]; then
                  output+="${line_counter}:"
              fi
              output+="$line"
              echo "$output"
          fi
        fi
    done < "${path}"
}

for file in "${files[@]}"; do
    perform_search "$pattern" $file
done

if [[ $only_names == "true" ]]; then
    echo ${file_names_to_print[*]} | tr " " "\n" | uniq
fi