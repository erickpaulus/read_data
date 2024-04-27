@echo off

REM This batch script searches for the file "log.txt" within all zip files in the directory "F:\Export Archive\ABC" and its subdirectories. If the file is found within a zip file, it extracts it to the directory "F:\erick\ABC".

REM Define the source directory where zip files are located
set "sourceDirectory=F:\Export Archive\ABC"

REM Define the file to search for within the zip files
set "searchFileName=log.txt"

REM Define the directory where the extracted file will be placed
set "destinationDirectory=F:\erick\ABC"

REM Define the path to the 7-Zip executable
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"

REM Check if 7-Zip executable exists
if not exist "%sevenZipPath%" (
    echo Error: 7-Zip executable not found at "%sevenZipPath%"
    pause
    exit /b
)

REM Loop through all zip files in the source directory and its subdirectories
for /r "%sourceDirectory%" %%F in (*.zip) do (

    REM Check if the file to search for exists within the current zip file
    "%sevenZipPath%" l "%%F" | findstr /i /c:"%searchFileName%" >nul && (

        REM Extract the file if found within the current zip file
        "%sevenZipPath%" x "%%F" -o"%destinationDirectory%" -y -r "%searchFileName%"
    )
)

pause
