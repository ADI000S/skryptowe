#!/bin/bash
#$1 - miasto
#klucz api z openWeather
api_key="af952005b87dee13260461981578d62c"
#zapytanie do strony openWeather które odrazu filruje i wypisuj jedynie potrzebne informacje
pogoda=$(curl -s "https://api.openweathermap.org/data/2.5/forecast?q=$1&appid=$api_key&units=metric" \
| jq -r '.list[] | select(.dt_txt | contains("12:00:00")) | "\(.dt_txt) - \(.main.temp)°C - \(.main.humidity)%\n"')
#przekazanie do pliku pdf informacji o pogodzie i miescie
echo -e "$1\n" > "prognozaMiasta$1.pdf"
echo -e "$pogoda" >> "prognozaMiasta$1.pdf"
