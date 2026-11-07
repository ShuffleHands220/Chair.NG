@echo off
rem ChairPlay + BeamNG launcher. Put this file in the same folder as ChairPlay.exe and double-click it.
rem (Right-click > Send to > Desktop (create shortcut) gives you a desktop icon.)
title ChairPlay for BeamNG

set CHAIRPLAY_BEAMNG=1
rem Optional: uncomment and change if you need them.
rem set CHAIRPLAY_BEAMNG_MIRROR=1
rem set CHAIRPLAY_BEAMNG_REDLINE=7000

cd /d "%~dp0"
if not exist "ChairPlay.exe" (
    echo ChairPlay.exe is not in this folder:
    echo   %~dp0
    echo Move ChairPlay-BeamNG.cmd into the folder that holds ChairPlay.exe and try again.
    pause
    exit /b 1
)

rem Mod check: looks for the bridge mod in BeamNG's user folder and copies it in if you put the zip next to this file.
set "MODS=%LOCALAPPDATA%\BeamNG\BeamNG.drive\current\mods"
if exist "%MODS%" (
    if not exist "%MODS%\chairplay_bridge.zip" (
        if exist "%~dp0chairplay_bridge.zip" (
            copy /y "%~dp0chairplay_bridge.zip" "%MODS%\" >nul && echo Installed the BeamNG mod into %MODS%
        ) else (
            echo NOTE: the BeamNG mod is not installed. Put chairplay_bridge.zip next to this file and run it again.
        )
    )
) else (
    echo NOTE: BeamNG's mods folder was not found at %MODS%
    echo       Put chairplay_bridge.zip there yourself: BeamNG launcher ^> Manage User Folder ^> mods.
)

start "" "ChairPlay.exe"
