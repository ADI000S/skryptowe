<#
.SYNOPSIS
Monitoruje folder i przenosi nowe pliki .txt do folderu docelowego.
.DESCRIPTION
Skrypt monitoruje folder zrodlowy i automatycznie przenosi kazdy nowo dodany plik .txt
do wskazanej lokalizacji. Jezeli folder docelowy nie istnieje, zostaje utworzony.
Skrypt dziala w petli nieskonczonej az do recznego zakonczenia(Ctrl+C).
.PARAMETER SourcePath
sciezka folderu zrodlowego.
.PARAMETER DestinationPath
sciezka folderu docelowego.
#>

    [Parameter(Mandatory)]
    [string]$SourcePath = "C:\Users\PC\Desktop\Prog-Skryptowe\monitorowany"

    [Parameter(Mandatory)]
    [string]$DestinationPath = "C:\Users\PC\Desktop\Prog-Skryptowe\kopiowane"

#Upewnienie sie, ze katalog docelowy istnieje
if (-not (Test-Path $DestinationPath)) {
    New-Item -ItemType Directory -Path $DestinationPath | Out-Null
}
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $SourcePath
$watcher.Filter = "*.txt"
$watcher.EnableRaisingEvents = $true
$watcher.IncludeSubdirectories = $false

$destFolder = $DestinationPath

Register-ObjectEvent -InputObject $watcher -EventName Created -Action {
    Start-Sleep -Milliseconds 500
    $name = $Event.SourceEventArgs.Name
    Write-Host "To:$name"
    write-host "$using:destFolder"
    $source = $Event.SourceEventArgs.FullPath
    $dest = Join-Path -Path $using:destFolder -ChildPath $name
    Write-Host "Plik: $name"
    Write-Host "Z: $source"
    Write-Host "Do: $dest"
    Move-Item -Path $source -Destination $dest -Force
    Write-Host "Przeniesiono plik: $name"
}

Write-Host "Monitoring folderu: $SourcePath"
Write-Host "Aby zatrzymac, uzyj Ctrl+C"

while ($true) {
    Start-Sleep -Seconds 1
}