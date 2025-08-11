@echo off
setlocal

:: Set path to 7z.exe if not in system PATH
set "zipExe=C:\Program Files\7-Zip\7z.exe"

:: Get full path to this script
set "scriptName=%~nx0"

:: Prompt user for folder path
set /p "folderPath=Enter the full path to the folder containing the files: "

:: Validate folder exists
if not exist "%folderPath%" (
    echo Folder does not exist: %folderPath%
    pause
    exit /b
)

:: Change to the specified folder
cd /d "%folderPath%"

:: Loop through all files in the folder
for %%F in (*.*) do (
    if /I not "%%~nxF"=="%scriptName%" (
        if not exist "%%~nF.7z" (
            echo Compressing %%F...
            "%zipExe%" a "%%~nF.7z" "%%F"
        ) else (
            echo Skipping %%F – archive already exists.
        )
    ) else (
        echo Skipping script file: %%F
    )
)

endlocal
pause