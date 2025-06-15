$login = Read-Host "Podaj nazwe uzytkownika"
$haslo = Read-Host "podaj haslo" -AsSecureString

$plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($haslo))
if ($login -eq "admin" -and $plainPassword -eq "password") {
    Write-Host "dane poprawne"
} else {
Write-Host "Nieporpawne dane logowania"
}
Write-Host $haslo