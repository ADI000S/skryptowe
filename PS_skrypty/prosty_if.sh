#!/bin/bash
read -p "Podaj liczbe" liczba

if [ $(($liczba%2)) -ne 0 ] && [ "$liczba" -gt 0 ]
then
echo "liczba jest dodatnia i nieparzysta"
else
echo "liczba nie jest dodatnia lub nieparzysta"
fi

