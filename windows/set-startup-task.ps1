param ( [string]$Name, [string]$Exe, [string]$Argument)

$action = New-ScheduledTaskAction -Execute $Exe -Argument $Argument
$trigger =  New-ScheduledTaskTrigger -AtStartup

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $Name # -Description ""