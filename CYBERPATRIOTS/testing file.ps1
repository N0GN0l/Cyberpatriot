
Invoke-Command ¨CComputername ¡°server1¡±, ¡°Server2¡± ¨CScriptBlock {Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" ¨CValue 1}