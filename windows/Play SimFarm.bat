@echo off
setlocal enabledelayedexpansion

set "GAMEDIR=%~dp0"
set "CONF=%GAMEDIR%simfarm.conf"
set "DOSBOX="

for %%P in (dosbox.exe) do (
    if not defined DOSBOX if exist "%%~$PATH:P" set "DOSBOX=%%~$PATH:P"
)

if not defined DOSBOX (
    for %%D in (
        "%ProgramFiles%\DOSBox-Staging\dosbox.exe"
        "%ProgramFiles(x86)%\DOSBox-Staging\dosbox.exe"
        "%ProgramFiles%\DOSBox-0.74-3\dosbox.exe"
        "%ProgramFiles(x86)%\DOSBox-0.74-3\dosbox.exe"
        "%ProgramFiles%\DOSBox\dosbox.exe"
        "%ProgramFiles(x86)%\DOSBox\dosbox.exe"
    ) do (
        if not defined DOSBOX if exist %%D set "DOSBOX=%%~D"
    )
)

if not defined DOSBOX (
    echo DOSBox was not found on this PC.
    echo.
    echo Run Setup.ps1 in this folder once to install it automatically, or
    echo install it yourself from https://www.dosbox.com/download.php
    echo ^(or the actively maintained fork: https://dosbox-staging.github.io/^)
    echo.
    pause
    exit /b 1
)

"!DOSBOX!" -conf "%CONF%"
