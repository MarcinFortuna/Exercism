#!/usr/bin/env bash
input=$(cat)
header="Team                           | MP |  W |  D |  L |  P"

if [[ -z "$input" ]]; then
    echo "$header"
    exit
fi

declare -A agg_results=()

table_line="0|0|0|0|0"

add_result_to_table_line() {
    old_line="$1"
    new_result="$2"
    played_matches=$(echo "$old_line" | cut -d'|' -f1 )
    wins=$(echo "$old_line" | cut -d'|' -f2 )
    draws=$(echo "$old_line" | cut -d'|' -f3 )
    losses=$(echo "$old_line" | cut -d'|' -f4 )
    points=$(echo "$old_line" | cut -d'|' -f5 )
    (( played_matches++ ))
    if [[ $new_result == "win" ]]; then
        ((wins++))
        ((points+=3))
    elif [[ $new_result == "loss" ]]; then
        ((losses++))
    else
        ((draws++))
        ((points++))
    fi
    echo "$played_matches|$wins|$draws|$losses|$points"    
}

parse_input_line() {
    line="$1"
    team_1=$(echo "$line" | cut -d';' -f1)
    team_2=$(echo "$line" | cut -d';' -f2)
    
    [[ ! -v agg_results[$team_1] ]] && { agg_results[$team_1]="$table_line"; }
    [[ ! -v agg_results[$team_2] ]] && { agg_results[$team_2]="$table_line"; }
    result=$(echo "$line" | cut -d';' -f3)
    
    case $result in
        win)
        winning_team_new_line=$(add_result_to_table_line "${agg_results[$team_1]}" "win")
        agg_results[$team_1]="$winning_team_new_line"
        losing_team_new_line=$(add_result_to_table_line "${agg_results[$team_2]}" "loss")
        agg_results[$team_2]="$losing_team_new_line"
        ;;
        
        loss)
        winning_team_new_line=$(add_result_to_table_line "${agg_results[$team_2]}" "win")
        agg_results[$team_2]="$winning_team_new_line"
        losing_team_new_line=$(add_result_to_table_line "${agg_results[$team_1]}" "loss")
        agg_results[$team_1]="$losing_team_new_line"
        ;;
        
        draw)
        team_1_new_line=$(add_result_to_table_line "${agg_results[$team_1]}" "draw")
        agg_results[$team_1]="$team_1_new_line"
        team_2_new_line=$(add_result_to_table_line "${agg_results[$team_2]}" "draw")
        agg_results[$team_2]="$team_2_new_line"
        ;;
        
        *)
        echo "Invalid result: $result."
        exit 1
    esac
}

while IFS="\n" read -r line; do
    parse_input_line "$line"
done <<< "$input"

results_as_rows=""
for key in "${!agg_results[@]}"; do
    results_as_rows+="$key|${agg_results[$key]}"
    results_as_rows+='\n'
done

sorted_rows=$(echo -en "$results_as_rows" | sort -k6,6nr -k1,1 -t'|')

echo "$header"
while IFS="|" read -r team mp w d l p; do
    printf "%-30s | %2s | %2s | %2s | %2s | %2s\n" "$team" "$mp" "$w" "$d" "$l" "$p"
done <<< "$sorted_rows"


