# run wsl vm
# wsl.exe --distribution Ubuntu-20.04
# run wsl in a background powershell
Start-Process -FilePath "wsl.exe" -ArgumentList "--distribution Ubuntu-20.04" -NoNewWindow -RedirectStandardOutput C:\Users\cchi\dev\wsl_network\stdout.txt -RedirectStandardError C:\Users\cchi\dev\wsl_network\stderr.txt
Start-Sleep -Seconds 3.0

# enable ssh port forwarding
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}
  
$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ($found) {
    $remoteport = $matches[0];
}
else {
    Write-Output "IP address could not be found";
    exit;
}

$windows_port = 6022
$wsl_port = 22

Invoke-Expression "netsh interface portproxy delete v4tov4 listenport=$windows_port";
Invoke-Expression "netsh advfirewall firewall delete rule name=$windows_port";
Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$windows_port connectport=$wsl_port connectaddress=$remoteport";
Invoke-Expression "netsh advfirewall firewall add rule name=$windows_port dir=in action=allow protocol=TCP localport=$windows_port";
Invoke-Expression "netsh interface portproxy show v4tov4";
