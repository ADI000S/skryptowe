#!/bin/bash

read -p "podaj login " login
read -p "podaj haslo " haslo

if [ $login == "admin" ] && [ $haslo == "password" ]
then
echo "dane sa poprawne"
else
echo " dane nie sa poprawne"
fi

