#!/usr/bin/env bash

# Created by Pawel Brzoza. Copyright (c) 2018

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

#default value
N=3
R=0

#parameters parsing
while [[ $# -gt 0 ]]
do
key="${1}"
case $key in
    -n|--n)
	if [[ -z ${2+x} ]]
	then
		shift     # past argument
	else 
		# checking if arg is a valid integer
		if [[ $2 =~ ^-?[0-9]+$ ]]
		then
			N="${2}"
			shift # past argument
    		shift # past value
		else
			shift # past argument
		fi
	fi
    ;;
    -n*|--n*)
	N="${key#*-n}"
	shift # past argument
	;;
    -r|--r)
    R=1
    shift # past argument
    ;;
    *)    # unknown option
		echo "ERROR: wrong parameters!"
		exit 0
esac
done

#drawing triangles

if [[ "${R}" -eq 1 ]]
then
# first style with -r argument
# x x x
#  x x
#   x
	for (( i=1; i<=${N}; i++ ))
	do
	    for (( j=${N}; j>=${i}; j-- ))
	    do
	        echo -n "x "
	    done
	    echo 
	    for (( k=0; k<${i}; k++))
	    do
	        echo -n ' '
	    done
done
else
# second style without -r argument
# x x x
# x x
# x
	for (( i=${N}; i>0; i-- ))
	do
		for (( j=0; j<${i}; j++))
		do
			echo -n "x "
		done
		echo ''
	done
fi
echo

## VERSION WITHOUT SPACES ##

# # first style with -r argument
# # xxxxxx
# # xxxxx
# #  xxxx
# #  xxx
# #   xx
# #   x
# 	for (( i=1; i<=${N}; i++ ))
# 	do
# 	    for (( j=${N}; j>=${i}; j-- ))
# 	    do
# 	        echo -n "x"
# 	    done
# 	    echo 
# 	    for (( k=2; k<=${i}; k+=2))
# 	    do
# 	        echo -n ' '
# 	    done
# 	done

# second style without -r argument
# xxx
# xx
# x
# 	for (( i=${N}; i>0; i-- ))
# 	do
# 		for (( j=0; j<${i}; j++))
# 		do
# 			echo -n "x"
# 		done
# 		echo ''
# 	done