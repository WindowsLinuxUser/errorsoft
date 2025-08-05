@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Admin check passed. Press any key to begin creation
        timeout /t -1
        goto make
    ) else (
        echo Error: You need to run this file as an administrator
        timeout /t 5 > nul
        exit
    )
    
    pause >nul

:make
cd /d "%~dp0"
echo Using 7-Zip to archive the source files...
start /wait .\bin\7z.exe a -t7z app.7z %~dp0\..\ -xr!installer -xr!.git -xr!.github
echo Moving archive to packaging directory...
move /-Y %~dp0\app.7z %~dp0\important\
echo Running Bat2Exe and generating executable...
start /wait .\bin\bat2exe.exe /source:%~dp0\important\ /target:C:\Users\%USERNAME%\Desktop\ /s /y
echo Generated! Now removing leftover app.7z...
del /f /s /q %~dp0\app.7z
if %errorLevel% == 0 (
    echo Installer Creation done! You will find the file on your Desktop.
    timeout /t 10 > nul
    exit
) else (
    echo Installer Creation Failed! ErrorLevel = %errorLevel%
    timeout /t 10 > nul
    exit
)
