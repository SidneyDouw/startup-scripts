param ( [string]$Name, [string] $Username ,[string]$Exe, [string]$Argument)

$domain_name = (Get-WmiObject Win32_Computersystem).name

$action = New-ScheduledTaskAction -Execute $Exe -Argument $Argument
$trigger =  New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserID "$domain_name\$Username" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $Name -Principal $principal