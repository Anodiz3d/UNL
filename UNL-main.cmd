@echo off

echo.
echo Made By #Anodized On roblox
echo.

echo.
echo Starting Unlock installation...
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://roblox-client-optimizer.simulhost.com/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: Unlock installation completed!
) else (
    echo Failed to download ClientAppSettings.json. Please report this issue in the #help-me channel of the Discord server.
    echo.
    echo ERROR: Unlock installation failed!
)

echo.
echo NOTE:
echo.
echo - Run this script every time Roblox updates!
echo.
echo.
echo.
echo.
echo Press any key to continue... & pause >nul