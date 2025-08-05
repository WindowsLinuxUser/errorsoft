@echo off

:menu
    cls
    echo Welcome to the Errorsoft Launcher! (Ver: 0.00)
    echo (1):Launch Errorsoft
    echo (2):Forcequit Errorsoft
    echo (3):Exit Launcher
    echo (4):Uninstall Errorsoft
    choice /C:1234 /M "Please pick an option above."
    if errorLevel 4 goto uninst
    if errorLevel 3 goto ex1t
    if errorLevel 2 goto forcequit
    if errorLevel 1 goto launch


:launch
    cls
    echo Launching Errorsoft...
    python.exe bios.py
    goto menu

:forcequit
    cls
    echo Forcequitting Errorsoft...
    echo Info: This will also quit any other python app.
    taskkill /f /im python.exe
    goto menu

:ex1t
    cls
    echo Exiting Launcher...
    exit

:uninst
    cls
    echo Are you sure you want to uninstall Errorsoft?
