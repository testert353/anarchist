@echo off
title BLACK CROW SYSTEM BREACH
color 04

:: An advanced script by SecondRoblox

:: === Launch fake site
start "" http://black-crow-server53.ct.ws

:: === Generate and run TTS VBS file
set "vbsFile=%temp%\blackcrowtts.vbs"
echo Set s=CreateObject("SAPI.SpVoice") > "%vbsFile%"
echo s.Speak "This is the Black Crow. Your system is compromised. We are removing every single file in your system32 folder. This is your warning." >> "%vbsFile%"
start "" wscript "%vbsFile%"

:: === Dramatic ASCII Art
echo.
echo :::::::::  :::            :::      ::::::::  :::    :::       ::::::::  :::::::::   ::::::::  :::       :::
echo :+:    :+: :+:          :+: :+:   :+:    :+: :+:   :+:       :+:    :+: :+:    :+: :+:    :+: :+:       :+:
echo +:+    +:+ +:+         +:+   +:+  +:+        +:+  +:+        +:+        +:+    +:+ +:+    +:+ +:+       +:+
echo +#++:++#+  +#+        +#++:++#++: +#+        +#++:++         +#+        +#++:++#:  +#+    +:+ +#+  +:+  +#+
echo +#+    +#+ +#+        +#+     +#+ +#+        +#+  +#+        +#+        +#+    +#+ +#+    +#+ +#+ +#+#+ +#+
echo #+#    #+# #+#        #+#     #+# #+#    #+# #+#   #+#       #+#    #+# #+#    #+# #+#    #+#  #+#+# #+#+#
echo #########  ########## ###     ###  ########  ###    ###       ########  ###    ###  ########    ###   ###
echo.

:: === Narration Terminal
start "BLACK CROW IS WATCHING" cmd /c "
color 0C
title BLACK CROW IS WATCHING
echo Welcome to the Black Crow System Breach.
echo -----------------------------------------
echo [!] Injecting payload into core processes...
ping localhost -n 1 >nul
echo [!] Hooking into explorer.exe cycle...
ping localhost -n 1 >nul
echo [!] Simulating system32 removal...
ping localhost -n 1 >nul
echo [!] Spawning auxiliary terminals...
ping localhost -n 1 >nul
echo [!] Beginning paranoia sequence...
ping localhost -n 1 >nul
echo -----------------------------------------
echo There is no escape.
"

:: === Multiple terminal chaos
start "BLACK CROW: ENCRYPTION" cmd /c "mode con: cols=70 lines=20 && color 04 && title BLACK CROW: ENCRYPTION && echo Encrypting files... && ping localhost -n 9999 >nul"
start "SYSTEM ALERT" cmd /c "mode con: cols=70 lines=20 && color 02 && title SYSTEM ALERT && echo WARNING: System failure imminent. && ping localhost -n 9999 >nul"
start "SECUREBOOT OVERRIDE" cmd /c "mode con: cols=70 lines=20 && color 06 && title SECUREBOOT OVERRIDE && echo BIOS lockdown bypassed. && ping localhost -n 9999 >nul"

:: === Looping file purge simulation
echo.
echo [BLACK CROW FILE PURGE SIMULATION STARTED]
echo You cannot stop this...
echo.

:: === Infinite loop, no Ctrl+C escape
:loop
for /f "delims=" %%F in ('dir /b /a:-d C:\Windows\System32 ^| findstr /i /r ".*\.exe .*\.dll .*\.sys"') do (
    echo Removing C:\Windows\System32\%%F...
    timeout /nobreak /t 0.2 >nul
)

:: Fake explorer restart
start explorer.exe
timeout /t 1 >nul
goto loop
