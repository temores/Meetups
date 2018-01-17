##Set visual effects to "Adjust for Best Performance"

$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'
try {
    $s = (Get-ItemProperty -ErrorAction stop -Name visualfxsetting -Path $path).visualfxsetting 
    if ($s -ne 2) {
        Set-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 2  
        }
    }
catch {
    New-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 2 -PropertyType 'DWORD'
    }


##Disable IPv6

Get-NetAdapterBinding |where{$_.ComponentID -eq "ms_tcpip6"} | Disable-NetAdapterBinding


##Disable Firewall

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False


##Disable Print Spooler Service, and Windows Audio Service

Get-Service spooler | Set-Service -StartupType Disabled
Get-Service audiosrv | Set-Service -StartupType Disabled


##Enable RDP with Network level Auth.
(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1) | Out-Null
(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(1) | Out-Null


##Disable UAC
Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -Value 0


#Turn Off ScreenSaver
Set-ItemProperty -Path ‘HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop\’ -Name ScreenSaveTimeOut -Value 0
Set-ItemProperty -Path ‘HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop\’ -Name ScreenSaveActive -Value 0
Set-ItemProperty -Path ‘HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop\’ -Name ScreenSaverIsSecure -Value 0


##Disable Drive indexing on C:\
$Drive = Get-Item C:\
$Drive.Attributes='Directory,NotContentIndexed'


##Set Power Plan to "High Performacnce"
$HighPerf = powercfg -l | %{if($_.contains("High performance")) {$_.split()[3]}}
$CurrPlan = $(powercfg -getactivescheme).split()[3]


##Disable Server Manager on start up
Get-ScheduledTask -TaskName servermanager | Disable-ScheduledTask


##Disable Feedback & Diagnostics    
Set-ItemProperty -ErrorAction SilentlyContinue -Path "HKCU:SOFTWARE\Microsoft\Siuf\Rules" -Name NumberOfSIUFInPeriod -Value 0 -Force | Out-Null
if ((Get-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Siuf\Rules" -Name PeriodInNanoSeconds -ErrorAction SilentlyContinue) -ne $null) { Remove-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Siuf\Rules" -Name PeriodInNanoSeconds }


##Disable IE Enhanced Security Config
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0 

