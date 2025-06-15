# Ścieżka do pliku raportu
$raportPath = "raport_sprzetowy.txt"

# Pobieranie informacji o hoście
$hostname = $env:COMPUTERNAME
$os = Get-WmiObject -Class Win32_OperatingSystem
$ram = Get-WmiObject -Class Win32_ComputerSystem
$dyski = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"

# Tworzenie treści raportu
$raport = @"
===== RAPORT SPRZĘTOWY =====
Data: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

--- Informacje o komputerze ---
Nazwa hosta: $hostname
System operacyjny: $($os.Caption) $($os.OSArchitecture)
Wersja systemu: $($os.Version)

--- Pamięć RAM ---
Zainstalowana pamięć RAM: $([math]::Round($ram.TotalPhysicalMemory / 1GB, 2)) GB

--- Dyski twarde ---
"@

foreach ($dysk in $dyski) {
    $rozmiar = [math]::Round($dysk.Size / 1GB, 2)
    $wolne = [math]::Round($dysk.FreeSpace / 1GB, 2)
    $raport += "Dysk $($dysk.DeviceID): $wolne GB wolne z $rozmiar GB`n"
}

# Zapis raportu do pliku
$raport | Out-File -FilePath $raportPath -Encoding UTF8

# Komunikat dla użytkownika
Write-Host "Raport został zapisany do pliku: $raportPath" -ForegroundColor Green