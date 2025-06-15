$liczba = Read-Host " Podaj liczbe"

if ([int]$liczba -gt 10){
    Write-Host "liczba jest wieksza od 10"
    } else {
    Write-Host " liczba jest mniejsza od 10"
    }
    