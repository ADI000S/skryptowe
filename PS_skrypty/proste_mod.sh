#!/bin/bash
read -p "podaj liczbe" li
echo $li
#echo $((6%2))
if [[ $li%2 -eq 0 ]] && [[ 3==3 ]]
then
echo 'przechodzi'
fi
