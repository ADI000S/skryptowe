$komp = $env:COMPUTERNAME

function date {
    Write-Host "-----------------------------------------"
    Write-Host "Aktualna data na $komp to $(Get-Date) "
    Write-Host "-----------------------------------------"
}
function wersja {
    $wersja = $(Get-ComputerInfo | Select-Object -ExpandProperty WindowsVersion)
    Write-Host "Wersja systemu na $komp to $wersja"
    Write-Host "-----------------------------------------"
}
function uzytkownik {
    Write-Host "Zalogowany użytkownik na $komp to $env:USERNAME"
    Write-Host "-----------------------------------------"
}
function ip {
    $ip = ipconfig | Select-String -Pattern 'IPv4.*'
    Write-Host "Adres IP na $komp to $ip"
    Write-Host "-----------------------------------------"
}
date
wersja
uzytkownik
ip
