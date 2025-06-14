#!/bin/bash

read -p "Podaj nazwe pliku do sprawdzenia " plik
#tworzy sume kontrolna wskazanego pliku za pomoca SHA-256
hash=$(sha256sum $plik | awk '{print $1}')
echo "suma kontrolna hash: $hash"
#wyslanie zapytania do api virustotal
odp=$(curl -s -X GET "https://www.virustotal.com/vtapi/v2/file/report?\
apikey=83df948511c8fd060677f4035f11ed6e79335c990ef852592638e1956f7aa0d4&\
resource=$hash")
#zczytuje odpowiedz od virustotal
positives=$(echo $odp | jq '.positives')
#echo $positives
#rozstrzyga czy plik jest bezpieczny czy nie
if [ $positives == 0 ] || [ $positives == "null" ]
then
echo "$plik jest bezpieczny"
else
echo "$plik jest niebezpieczny"
fi




#response=$(curl --request POST \
 #    --url https://www.virustotal.com/api/v3/files \
  #   --header 'accept: application/json' \
   #  --header 'content-type: multipart/form-data' \
   #  --header 'x-apikey: 83df948511c8fd060677f4035f11ed6e79335c990ef852592638e1956f7aa0d4' \
   #  --form file="@$plik")
#echo $response
