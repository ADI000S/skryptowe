# klucz aApi
$apiKey = "83df948511c8fd060677f4035f11ed6e79335c990ef852592638e1956f7aa0d4"

# Ścieżka do pliku
$filePath = "C:\Users\PC\Desktop\Prog-Skryptowe\monitorowany\nowy.txt"

# obliczamy sume kontrolna SHA256
$sha256 = Get-FileHash -Path $filePath -Algorithm SHA256
$hashValue = $sha256.Hash
Write-Host "SHA256: $hashValue"

# wysylamy zapytanie do virustotal
$Url = "https://www.virustotal.com/api/v3/files/$hashValue"
$headers = @{"x-apikey" = $apiKey}

# wyslanie zapytania
$response = Invoke-RestMethod -Uri $Url -Headers $headers -Method GET

# sprawdzamy liczbe detekcji
$malicious = $response.data.attributes.last_analysis_stats.malicious
$total = $response.data.attributes.last_analysis_stats.harmless + $malicious + $response.data.attributes.last_analysis_stats.undetected

#generujemy odpowiedz dla uzytkownika
Write-Host "Wykrycia złośliwego kodu: $malicious z $total"

if ($malicious -gt 0) {
    Write-Host "Plik jest niebezpieczny"
} else {
    Write-Host "Plik wygląda na bezpieczny."
}