param ( [string]$Program )

$program_name = Split-Path -Path -$Program -Leaf
New-NetFirewallRule -DisplayName $program_name -Direction Inbound -Program $Program -Action Allow