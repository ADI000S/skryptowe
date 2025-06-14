#!/bin/bash

data() {
echo "Aktualna data $HOSTNAME $(date)"
}
linux() {
echo "Obecna wersja $HOSTNAME $(uname -a)"
}
uzytkownik(){
echo "Zalogowany uzytkownik na $HOSTNAME to $(whoami)"
}
IP(){
echo "Adres IP na $HOSTNAME to $(hostname -I | awk '{print $1}')"
}

data
linux
uzytkownik
IP

