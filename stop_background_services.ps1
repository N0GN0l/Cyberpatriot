Stop-Service -Name Spooler -Force -ErrorAction Ignore
Set-Service -Name Spooler -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name RemoteAccess -Force -ErrorAction Ignore
Set-Service -Name RemoteAccess -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name RemoteRegistry -Force -ErrorAction Ignore
Set-Service -Name RemoteRegistry -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name msftpsvc -Force -ErrorAction Ignore
Set-Service -Name msftpsvc -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name telnet -Force -ErrorAction Ignore
Set-Service -Name telnet -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name upnphost -Force -ErrorAction Ignore
Set-Service -Name upnphost -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name SSDPSRV -Force -ErrorAction Ignore
Set-Service -Name SSDPSRV -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name tftpsvc -Force -ErrorAction Ignore
Set-Service -Name tftpsvc -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name tapisrv -Force -ErrorAction Ignore
Set-Service -Name tapisrv -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name lmhosts -Force -ErrorAction Ignore
Set-Service -Name lmhosts -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name SNMPTRAP -Force -ErrorAction Ignore
Set-Service -Name SNMPTRAP -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name SessionEnv -Force -ErrorAction Ignore
Set-Service -Name SessionEnv -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name TermService -Force -ErrorAction Ignore
Set-Service -Name TermService -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name TlntSvr -Force -ErrorAction Ignore
Set-Service -Name TlntSvr -StartupType Disabled -ErrorAction Ignore
Stop-Service -Name seclogon -Force -ErrorAction Ignore
Set-Service -Name seclogon -StartupType Disabled -ErrorAction Ignore

Start-Service -Name EventLog -ErrorAction Ignore
Set-Service -Name EventLog -StartupType Automatic -ErrorAction Ignore