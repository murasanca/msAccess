@ECHO OFF
sc stop "msAccess"
sc delete "msAccess"
sc stop "WinDivert"
sc delete "WinDivert"
sc stop "WinDivert14"
sc delete "WinDivert14"