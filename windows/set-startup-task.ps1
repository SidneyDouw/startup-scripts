param ( [string]$Name, [string]$Exe, [string]$Argument)

$action = New-ScheduledTaskAction -Execute $Exe -Argument $Argument
$trigger =  New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $Name -Principal $principal