#!/bin/bash
#
#

set -e

display_usage() { 
	echo "An input file of tokens is needed." 
	echo -e "\nUsage:\n$0 [tokens_file.txt] \n" 
	} 

if [  $# -ne 1 ] 
	then 
		display_usage
		exit 1
	fi 

i=0
while IFS=$'\n' read -r line_data; do
    echo $line_data
    TOKENS[i]="${line_data}"
    ((++i))
done < $1

while true ; do 
  for TOKEN in "${TOKENS[@]}"; do
    CMD="apn push '$TOKEN' -c ./puc_voip.pem -m'Live'"
    eval $CMD
    echo $TOKEN
    echo $CMD
  done
  sleep 180 
done
