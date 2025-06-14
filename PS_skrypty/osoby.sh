#!/bin/bash
read -p "Podaj imie " miejsce
read -p "Podaj rok urodzenia " rok

obecny_rok=$(date +"%Y")
wiek=$(($obecny_rok-$rok))
echo "Imie: $miejsce"
echo "Wiek: $wiek"
