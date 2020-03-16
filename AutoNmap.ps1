<#
    Company Name: Panacea Infosec Pvt. Ltd.
    Author Name: Akshay Jain
    License: BSD 3-Clause
    Required Dependencies: Nmap
    Pratform: Microsoft Windows


.SYNOPSIS
Nmap Scripter

#>

Write-Host "[+] Nmap Scripter by Panacea Infosec (P) Ltd." -ForegroundColor Yellow
Write-Host "[+] Website: www.panaceainfosec.com" -ForegroundColor Yellow
Write-Host "[!] Using Default Nmap installed directory, MAKE SURE SYSTEM WILL NOT GET SHUTDOWN DURING THE SCHEDULE" -ForegroundColor Green
Write-Host "[!] Creating output folder under C:\PanaceaInfosec\" -ForegroundColor Green
Write-Host "[!] Please Make sure all IP Addresses are under C:\ip.txt" -ForegroundColor Red -BackgroundColor White


$pram1 = "-v -Pn -iL C:\ip.txt -oA C:\PanaceaInfosec\tcp-top-port"
$pram2 = "-v -p- -Pn -iL C:\ip.txt -oA C:\PanaceaInfosec\tcp-all-port"
$pram3 = "-v -sU -Pn -iL C:\ip.txt -oA C:\PanaceaInfosec\udp-top-port"
$pram4 = "-v -sU -Pn -p- -iL C:\ip.txt -oA C:\PanaceaInfosec\udp-all-port"

mkdir -Path "C:\PanaceaInfosec\" -erroraction 'silentlycontinue'

$toptcp = New-Object System.Management.Automation.Host.ChoiceDescription '&1 TCP Top Port Scan'
$fulltcp = New-Object System.Management.Automation.Host.ChoiceDescription '&2 TCP Full Port Scan'
$topudp = New-Object System.Management.Automation.Host.ChoiceDescription '&3 UDP Top Port Scan'
$fulludp = New-Object System.Management.Automation.Host.ChoiceDescription '&4 UDP Full Port Scan'
$options = [System.Management.Automation.Host.ChoiceDescription[]]($toptcp, $fulltcp, $topudp, $fulludp)

$title = "SCAN TYPE:"
$message = 'Please provide your choice of scan:'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)


switch($result)
{
    0 { Start-Process -FilePath "C:\Program Files (x86)\Nmap\nmap.exe" -ArgumentList "$pram1" }
    1 { Start-Process -FilePath "C:\Program Files (x86)\Nmap\nmap.exe" -ArgumentList "$pram2" }
    2 { Start-Process -FilePath "C:\Program Files (x86)\Nmap\nmap.exe" -ArgumentList "$pram3" }
    3 { Start-Process -FilePath "C:\Program Files (x86)\Nmap\nmap.exe" -ArgumentList "$pram4" }
}
