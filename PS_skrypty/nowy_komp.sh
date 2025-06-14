#!/bin/bash


#sprawdzenie aktualizacj i ich instalacja

check_upd() {
echo "------------------------------"
echo "Sprawdzanie i aktualizacja..."
#musze to zahaszować, poniewaz za kazdym razem aktualizuje mi sie system 
sudo apt update
#sudo apt upgrade -y
}

#Instalacja thunderbird
install_T() {
echo "------------------------------"
echo "Instalacja Thunderbird"
sudo apt install -y thunderbird
}

#dodawanie uzytkownika

dod_user() {

echo "------------------------------"
echo "Dodawanie użytkownika"
local uzytk=$1
#pytanei o nazwe uzytkownika
#read -p "Podaj nazwe nowego użytkownika" username

sudo adduser $uzytk

}

#dodawanie kat dla nowego pracownika

dod_kat() {
echo "------------------------------"
echo "Tworzenie katalogow"
sciezka_uzyt="/home/$nazwa"
sudo mkdir -p "$sciezka_uzyt/Documents" "$sciezka_uzyt/Pictures" "$sciezka_uzyt/Videos"
}

#wypisuje wszstkie informacje takie jak wersja, IP i MAC
wys_inf() {
echo "------------------------------"
echo "Wersja systemu to"
lsb_release -a | awk 'NR>=1'
echo "Adres IP= $(hostname -I | awk '{print $1}')"
echo "Adres MAC= $(ip link show | awk '/ether/ {print $2}')"
}

#funkcja wykonujaca wszstkie pozostale funkcje
funkcja_glowna() {
read -p "podaj nazwe uzytkownika" nazwa
local name=$nazwa
cat << AAA
1) check_upd
2) install_T
3) dod_user "$name"
4) dod_kat
5) wys_inf
AAA
read -p "Jesli  chcesz wykonac pojedyncza funkcje kliknij liczbe od 1 do 5 jesli wszystkie 6 " numer

case $numer in
1)
check_upd ;;
2)
install_T ;;
3)
dod_user "$name" ;;
4)
dod_kat ;;
5)
wys_inf ;;
6)
check_upd; install_T; dod_user "$name"; dod_kat; wys_inf ;;
*)
echo "Nie poprawny numer"
esac

echo "Koniec"
}


funkcja_glowna
