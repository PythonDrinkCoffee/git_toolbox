#!/bin/bash

# Crated by PythonDrinkCoffee - Bart Barszczewski
usage() { echo -e "Usage: git_log.sh -l 5 -s 10 \n\nOPTIONS:\n\t line amount  -l N\t[ N must be greater than 4 lines]\n\t seconds amount  -s N\t[ N must be greater than 4 seconds ]\n\n" 1>&2; exit 1; }

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

echo $lineamount
echo $seconds

if [ $lineamount -lt 5 ] || [ $seconds -lt 5 ]; then
        usage
	exit 0
fi

if [ -z "$lineamount" ] || [ -z "$seconds" ]; then
	usage
	exit 0
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
# ERRORS??
#
# "/bin/bash^M: bad interpreter: No such file or directory"
#
#
# RESOLVE ERROR
# use this below command:
#
# sed -i -e 's/\r$//' git_log.sh
#
# ========================================================
