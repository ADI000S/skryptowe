#!/bin/bash

# Podajemy nazwe pliku
# szukana jest lokalizacja (trzeba miec zaktualizowana baze)
# Najpierw sprawdzamy czy istnieje potem czy jest katalogiem i czy jest pusty kat/plik


#read -p "czy chcesz zaktualizowac baze danych" odp
#if [[ $odp == 'y' || $odp == 'tak' ]]
#then
#	sudo updatedb
#fi
read -p "jaki plik sprawdzic " plik


if [[ -n $plik ]]
then
	lokalizacja=$(locate $plik | awk 'NR==1')
#echo $lokalizacja
if [[ $plik == $(echo $lokalizacja | rev | cut -d'/' -f 1 | rev) ]]
then

	rozmiar=$(ls -l $lokalizacja | awk '{print $5}')
	#echo $rozmiar
	if [[ -d $lokalizacja ]]
	then
	#echo "katalog"
	#czy_kat_pusty=$(ls -A $lokalizacja)
		if [[ $(ls -A $lokalizacja) ]]
		then
		echo "plik istanieje"
		echo "plik nie jest pusty"
		echo "plik jest katalogiem"
		else
		echo "plik istanieje"
		echo "plik jest pusty"
		echo "plik jest katalogiem"
		fi
	else
		if [[ $rozmiar -eq 0 ]]
		then
		echo "plik istanieje"
		echo "plik jest pusty"
		echo "plik nie jest katalogiem"
		else
		echo "plik istanieje"
		echo "plik nie jest pusty"
		echo "plik nie jest katalogiem"
		fi
	fi

else
	echo "Plik nie istnieje"
	echo "Plik jest pusty"
	echo "Plik nie jest katalogiem"
fi
fi
