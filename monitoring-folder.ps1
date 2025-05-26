# Ścieżki folderów
$watchPath = "C:\Users\PC\Desktop\Prog-Skryptowe\monitorowany"
$destinationPath = "C:\Users\PC\Desktop\Prog-Skryptowe\kopiowane"

# tworzenie pliku docelowego jesli istnieje 
if (-not (Test-Path $destinationPath)) {
    New-Item -Path $destinationPath -ItemType Directory
    Write-Host "Utworzono folder docelowy: $destinationPath"
    Write-Host "1"
}

# tworzymy obiekt watcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $watchPath
$watcher.Filter = "*.txt"
$watcher.EnableRaisingEvents = $true
$watcher.IncludeSubdirectories = $false

# Funkcja do obsługi zdarzenia dodania pliku

write-host "$destinationPath"

$onCreated = Register-ObjectEvent $watcher Created -Action {
    Start-Sleep -Seconds 1  
    Write-Host "3"
    Write-Host "a"
    write-host "$using"
    Write-Host "a $using:destinationPath"
    
    $sourcePath = $Event.SourceEventArgs.FullPath
    Write-Host "$sourcePath"
    $fileName = $Event.SourceEventArgs.Name
    write-host "$fileName"
    $destFile = Join-Path -Path $using:destinationPath -ChildPath $fileName
    write-host "$destinationPath"
    write-host $destFile
    Move-Item -Path $sourcePath -Destination $destFile
    Write-Host "Przeniesiono plik: $fileName"
}

Write-Host "Monitorowanie folderu: $watchPath. Naciśnij Ctrl+C, aby zatrzymać."

# Nieskończona pętla
while ($true) {
    Start-Sleep -Seconds 1
}



