#!/usr/bin/env bash

echo "${1/[,\*\']/}" | tr '[:lower:]' '[:upper:]' | tr -d "_" | grep -Po "(?<=\b)\w" | tr -d " \n\t"
