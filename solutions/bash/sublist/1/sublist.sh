#!/usr/bin/env bash
listA=$(echo $1 | tr -d "[]" | sed s/$/,/)
listB=$(echo $2 | tr -d "[]" | sed s/$/,/)
if [[ $listA == $listB ]]; then
    echo "equal"
elif [[ $listA =~ $listB ]]; then
    echo "superlist"
elif [[ $listB =~ $listA ]]; then
    echo "sublist"
else
    echo "unequal"
fi