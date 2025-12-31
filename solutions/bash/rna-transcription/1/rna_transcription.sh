#!/usr/bin/env bash

if [[ -z $1 ]]; then
    echo ""
    exit
fi

if [[ ! "$1" =~ ^[GCTA]+$  ]]; then
    echo "Invalid nucleotide detected."
    exit 1
fi

echo $1 | tr 'GCTA' 'CGAU'