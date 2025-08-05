@echo off
set gamever=0.00

:menu
    cls
    title Errorsoft Launcher
    echo Welcome to the Errorsoft Launcher! (Ver: %gamever%)
    echo (1):Launch Errorsoft
    echo (2):Forcequit Errorsoft
    echo (3):Exit Launcher
    echo (4):Uninstall Errorsoft
    choice /C:1234 /M "Please pick an option above."
    if errorLevel 4 goto uninst
    if errorLevel 3 goto ext
    if errorLevel 2 goto forcequit
    if errorLevel 1 goto launch


:launch
    cls
    title Errorsoft Console version %gamever%
    echo Launching Errorsoft...
    python.exe bios.py
    del .\__pycache__\*
    rmdir .\__pycache__\
    goto menu

:forcequit
    cls
    echo Forcequitting Errorsoft...
    echo Info: This will also quit any other python app.
    taskkill /f /im python.exe
    goto menu

:ext
    cls
    echo Exiting Launcher...
    exit

:uninst
    cls
    echo Are you sure you want to uninstall Errorsoft?
