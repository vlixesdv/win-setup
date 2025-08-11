@echo off
setlocal

:: Set path to 7z.exe if not in system PATH
set "zipExe=C:\Program Files\7-Zip\7z.exe"

:: Get this script's filename
set "scriptName=%~nx0"

:: Prompt user for the folder path
set /p "folderPath=Enter the full path containing folders to compress: "

:: Validate the folder exists
if not exist "%folderPath%" (
    echo Folder does not exist: %folderPath%
    pause
    exit /b
)

:: Change to the specified folder
cd /d "%folderPath%"

:: Loop through all directories (folders) only
for /d %%D in (*) do (
    if not exist "%%D.zip" (
        echo Compressing folder %%D into %%D.zip...
        "%zipExe%" a "%%D.zip" "%%D\*"
    ) else (
        echo Skipping %%D – archive already exists.
    )
)

endlocal
pause