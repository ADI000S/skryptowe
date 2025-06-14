#!/bin/bash

#for i in {1..10}
#do
#echo "192.168.0.$i"
#done
i=1
while [[ $i -le 10 ]]
do
	echo "192.168.0.$i"
	((i++))
done
