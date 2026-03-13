@echo off

cd /d "%~dp0"

for %%i in (1 2 3 4 5 6 7 8 9) do taskkill /f /im msAccess%%i.exe>nul 2>&1

sc stop "msAccess">nul 2>&1
sc delete "msAccess">nul 2>&1

sc stop "WinDivert">nul 2>&1
sc delete "WinDivert">nul 2>&1

sc stop "WinDivert14">nul 2>&1
sc delete "WinDivert14">nul 2>&1