#!/bin/bash

# Crated by PythonDrinkCoffee - Bart Barszczewski
usage() { echo -e "Usage: git_log.sh -l 5 -s 10 \n\nOPTIONS:\n\t line amount  -l N\t[ N must be greater then 4 lines]\n\t seconds amount  -s N\t[ N must be greater than 4 seconds ]\n\n" 1>&2; exit 1; }

while getopts ':l:s:' flag;
do
	case "${flag}" in
		l) lineamount=${OPTARG};;
		s) seconds=${OPTARG};;
		*) 
		   usage ;;
	esac
done
shift $((OPTIND-1))

if [ -z "$lineamount" ] || [ -z "$seconds" ]; then
	usage
fi

for (( ; ;))
do
	clear
	echo -e "\n============= CURRENT HEAD ======================"
	git log --oneline -n 1
	echo -e "===================================================\n"
	git log --oneline @^ -n "$lineamount"
	sleep "$seconds"
done

# ========================================================
