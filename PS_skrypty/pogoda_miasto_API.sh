#!/bin/bash

#$1-miasto
api_key="af952005b87dee13260461981578d62c"

#api_key2="48567be200ceab326525830878bd0040"
odp=$(curl -s -X GET "http://api.openweathermap.org/geo/1.0/direct?q=$1&limit=1&appid=$api_key")
lat=$(echo $odp | jq '.[0].lat')
lon=$(echo $odp | jq '.[0].lon')
echo $lat $lon
#echo $odp | grep "lat"

#wyszukujemy pogode dla danej lokalizacji miasta
pogoda=$(curl -s -X GET "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$api_key")
echo $pogoda

