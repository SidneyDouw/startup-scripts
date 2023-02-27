param ( [int]$Port, [string]$Protocol)

New-NetFirewallRule -DisplayName "ALLOW $Protocol PORT $Port" -Direction Inbound -Profile Any -Action Allow -LocalPort $Port -Protocol $Protocol