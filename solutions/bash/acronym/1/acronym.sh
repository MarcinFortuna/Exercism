#!/usr/bin/env bash

echo ${1/[,\*\']/} | tr 'a-z' 'A-Z' | tr -d "_" | grep -Po "(?<=\b)\w" | tr -d " \n\t"
