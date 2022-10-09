set object = createobject("wscript.shell") 
object.run "C:\Users\cchi\dev\wsl_network\PsExec.exe -i 1 powershell.exe -WindowStyle hidden -File C:\Users\cchi\dev\wsl_network\run_wsl2_at_startup.ps1", 0

