Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
New-NetFirewallRule -DisplayName "Block 23" -Direction Inbound -LocalPort 23 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 1337" -Direction Inbound -LocalPort 1337 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 515" -Direction Inbound -LocalPort 515 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 111" -Direction Inbound -LocalPort 111 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 135" -Direction Inbound -LocalPort 135 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 137" -Direction Inbound -LocalPort 137 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 138" -Direction Inbound -LocalPort 138 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 139" -Direction Inbound -LocalPort 139 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block 69" -Direction Inbound -LocalPort 69 -Protocol TCP -Action Block | Out-Null
Get-NetFirewallRule -DisplayGroup 'Network Discovery' | Set-NetFirewallRule -Profile 'Private, Domain' -Enabled false
Set-MpPreference -DisableRealtimeMonitoring $False
Set-MpPreference -PUAProtection Enabled
