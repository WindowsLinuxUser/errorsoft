@echo off
set InstPath="C:\Program Files\Errorsoft\1.0\"
set appver=0.00
title Errorsoft Setup, version %appver%
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Admin check passed. Press any key to begin the installation
        timeout /t -1
        goto prompt
    ) else (
        echo Error: You need to run this file as an administrator
        timeout /t 5 > nul
        exit
    )
    
    pause >nul

:prompt
    cls
    color 17
    echo Welcome to the Errorsoft Installer!
    echo This setup script asks questions to figure out your configuration, then installs the game to your computer.
    echo If you already have this installed, then you shouldn't re-run this program, unless you need to:
    echo (1): Re-install this program
    echo (2): Repair files
    choice /C YN /M "Would you like to continue the installation?"
    if errorlevel 2 goto exit
    if errorlevel 1 goto install

:install
    echo Installation started.
    timeout /t 1 > nul
    cls
    echo Section 1: Dependencies
    echo Question 1:
    choice /C YN /M "Do you have Python installed?"
    if errorlevel 2 goto pyinst
    if errorlevel 1 goto pygameask

    :pyinst
       echo Python is a required dependency of Errorsoft, meaning it will not work without it.
       echo AutoInstall coming soon!
       echo Now installing Python 3.13...
       start /wait .\python313_win7compat.exe

    :pygameask
       echo Make sure you also have Python in your PATH, else the script won't work.
       timeout /t -1
       cls
       echo Question 1a:
       choice /C YN /M "Do you have PyGame installed?"
       if errorlevel 2 goto pygameinst
       if errorlevel 1 goto sect2

       :pygameinst
          cls
          echo PyGame is a required dependency of Errorsoft, meaning it will not work without it.
          echo Now installing PyGame...
          start /wait pip install pygame
          goto sect2

:sect2
    cls
    echo Section 2: Installing files
    echo Decompressing app.7z to Program Files...
    del /f /s /q %InstPath%\*
    mkdir %InstPath%
    cd %InstPath%
    start /wait %~dp0\7z.exe x %~dp0\app.7z -o%InstPath%
    xcopy %~dp0\insticon.ico %InstPath%\icon.ico
    timeout /t 10 /nobreak
    del app.7z
    echo Making shortcut on Desktop...
    start /wait %~dp0\shortcut.exe /T:%InstPath%\launch.bat /A:C /F:"C:\Users\%USERNAME%\Desktop\Errorsoft 1.0.lnk" /I:%InstPath%\icon.ico /W:%InstPath%
    goto finish

:finish
    cls
    echo Setup has completed the installation of Errorsoft v1.0
    timeout /t -1
    goto exit

:exit
    echo Now exiting setup...
    timeout /t 1 > nul
    color 07
    cls
    exit