$csv = Import-Csv -Path "input_file.csv" -Delimiter ";"
$info = Get-ComputerInfo

$computerInfo = Get-CimInstance -ClassName Win32_ComputerSystem
$biosInfo = Get-CimInstance -ClassName Win32_BIOS
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
$cpuInfo = Get-CimInstance -ClassName Win32_Processor
foreach ($row in $csv) {
    if ($row.GenerateReport -eq "True") {
        switch ($row.Component) {
                "Computername"   { Write-Host "Computername: $env:COMPUTERNAME" }
            "Manufacturer"   { Write-Host "Manufacturer: $($computerInfo.Manufacturer)" }
            "Model"          { Write-Host "Model: $($computerInfo.Model)" }
            "SerialNumber"   { Write-Host "SerialNumber: $($biosInfo.SerialNumber)" }
            "CpuName"        { Write-Host "CpuName: $($cpuInfo.Name)" }
            "RAM"            { 
                $ramGB = [math]::Round($computerInfo.TotalPhysicalMemory / 1GB, 0)
                Write-Host "RAM: $ramGB GB" }
        }
    }
}
