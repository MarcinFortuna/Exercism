#!/usr/bin/env bash

common_denom() {
  # Accept two denominators as args
  # Return the least common multiple
  if [[ $1 -eq 0 || $2 -eq 0 ]]; then
      echo "0 cannot be a denominator!"
      exit 1
  fi
  den1=$1
  den2=$2
  while (( den1 != den2 )); do
      if (( den1 < den2 )); then
          ((den1+=$1))
      else
          ((den2+=$2))
      fi
  done
  echo $den1
}

reduce_to_lowest_terms() {
    #Input: clean fraction with poss. "-" in the numerator only
    num_abs="${1#-}"
    den="$2"
    if (( num_abs < den )); then
        i=$num_abs
    else
        i=$den
    fi
    while (( i > 1)); do
        while (( num_abs % i == 0 && den % i == 0 )); do
            num_abs=$(( num_abs / i ))
            den=$(( den / i ))
        done
        ((i--))
    done
    output=""
    [[ "$1" -lt 0 ]] && { output+="-"; }
    output+="$num_abs/$den"
    echo "$output"
}

reduce_and_clean() {
    num="$1"
    numerator=$(echo "$num" | sed -E "s|/.*||")
    denominator=$(echo "$num" | sed -E "s/^.*\///")
    if (( numerator == 0 && denominator != 0)); then
        echo "0/1"
    else
        if [[ $denominator =~ ^- ]]; then
            denominator="${denominator#-}"
            if [[ $numerator =~ ^- ]]; then
                numerator="${numerator#-}"
            else
                numerator="-${numerator}"
            fi
        fi
        reduce_to_lowest_terms $numerator $denominator
    fi
}

add_subtract() {
    operation="$1"
    num_1="$2"
    num_2="$3"
    # Step 1: Extract denominators and numerators
    denom_1=$(echo $num_1 | sed -E "s/^.*\///")
    denom_2=$(echo $num_2 | sed -E "s/^.*\///")
    numerator_1=$(echo $num_1 | sed -E "s|/.*||")
    numerator_2=$(echo $num_2 | sed -E "s|/.*||")
    # Step 2: Find common denominator
    common_d=$(common_denom "$denom_1" "$denom_2")
    # Step 3: Multiply both numerators accordingly
    if [[ $common_d -gt $denom_1 ]]; then
        # Calculate factor to multiply
        factor_1=$(( $common_d / $denom_1 ))
        (( numerator_1 *= factor_1 ))
    fi
    if [[ $common_d -gt $denom_2 ]]; then
        factor_2=$(( $common_d / $denom_2 ))
        (( numerator_2 *= factor_2 ))
    fi
    # Step 4: Add/subtract the numerator
    if [[ $operation == "+" ]]; then
        common_n=$(( numerator_1 + numerator_2 ))
    else
        common_n=$(( numerator_1 - numerator_2 ))
    fi
    # Step 5: Pass the result to the reduction function
    reduce_and_clean "$common_n/$common_d"
}

multiply_divide() {
    operation="$1"
    num_1="$2"
    num_2="$3"
    # Step 1: Extract denominators and numerators
    denom_1=$(echo $num_1 | sed -E "s/^.*\///")
    denom_2=$(echo $num_2 | sed -E "s/^.*\///")
    numerator_1=$(echo $num_1 | sed -E "s|/.*||")
    numerator_2=$(echo $num_2 | sed -E "s|/.*||")
    # Step 2: Calculate the result
    if [[ $operation == '*' ]]; then
        common_n=$(( numerator_1 * numerator_2 ))
        common_d=$(( denom_1 * denom_2 ))
    else
        # Multiply by a reciprocal
        common_n=$(( numerator_1 * denom_2 ))
        common_d=$(( denom_1 * numerator_2 ))
    fi
    # Step 3: Pass to the reduce function
    reduce_and_clean "$common_n/$common_d"
}

pow() {
    pow="${2#-}"
    [[ $pow == "0" ]] && { echo "1/1"; exit; }
    base="$1"
    numerator=$(echo $base | sed -E "s|/.*||")
    denominator=$(echo $base | sed -E "s/^.*\///")
    pow_numerator=$(( $numerator ** $pow ))
    pow_den=$(( $denominator ** $pow ))
    if [[ $2 -gt 0  ]]; then
        reduce_and_clean "$pow_numerator/$pow_den"
    else
        reduce_and_clean "$pow_den/$pow_numerator"
    fi
}

rpow() {
    [[ $2 =~ "0/" ]] && { echo "1.0"; exit;}
    result=$(echo "$1" "$2" | awk '{ split($2, a, "/"); print $1 ^ (a[1] / a[2]) }')
    if [[ ! $result =~ \. ]]; then
        echo "$result.0"
    else
        echo "$result"
    fi
}

case $1 in
  '+')
    add_subtract $1 $2 $3
    ;;

  '-')
    add_subtract $1 $2 $3
    ;;

  '*')
    multiply_divide "$1" $2 $3
    ;;

  '/')
    multiply_divide "$1" $2 $3
    ;;
    
  'abs')
    reduce_and_clean $(echo $2 | tr -d "-")
    ;;

  'pow')
    pow $2 $3
    ;;

  'rpow')
    rpow $2 $3
    ;;

  'reduce')
    reduce_and_clean "$2"
    ;;
    
  *)
    echo "Non-existent operation"
    ;;
esac