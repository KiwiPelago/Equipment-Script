function Decode {
    If ($args[0] -is [System.Array]) {
        [System.Text.Encoding]::ASCII.GetString($args[0])
    }
    Else {
        "Not Found"
    }
}
echo "MONITORS
Name, Serial"
ForEach ($Monitor in Get-WmiObject WmiMonitorID -Namespace root\wmi) {  
    $Name = Decode $Monitor.UserFriendlyName -notmatch 0
    $Serial = Decode $Monitor.SerialNumberID -notmatch 0
    

 

    echo "$Name, $Serial"
}

 

 

 

 

$c = Wmic computersystem get model 
$b = wmic bios get serialnumber

 

$a = gwmi win32_computersystem | Select-Object -ExpandProperty name

 

write-host "
COMPUTER
NAME: $a
SERIAL: $b
MODEL: $c"
Read-Host "
Push Enter to Exit"