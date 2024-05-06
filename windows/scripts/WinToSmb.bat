@echo off
setlocal ENABLEDELAYEDEXPANSION

set "inputPath=%~1"

rem Check if the path is a local path (drive letter or UNC path)
if "!inputPath:~1,1!" equ ":" (
    rem Check if it's a network drive and replace the drive letter with the network path
    for /f "tokens=2 delims= " %%A in ('net use %inputPath:~0,2% ^| find "\\"') do (
        set "inputPath=%%A!inputPath:~2!"
    )
)

rem Convert backslashes to forward slashes
set "inputPath=!inputPath:\=/!"

rem Remove leading double slashes (if any)
if "!inputPath:~0,2!" == "//" set "inputPath=!inputPath:~2!"

rem Replace spaces with %20
set "inputPath=!inputPath: =%%20!"

rem Check if the path is a local path (drive letter or UNC path)
if "!inputPath:~1,1!" equ ":" (
    rem Add "file:///" at the beginning for local paths
    set "uri=file:///!inputPath!"
) else (
    rem Add "smb://" at the beginning for network paths
    set "uri=smb://!inputPath!"
)

rem DEBUG output
echo !uri!

rem Copy the URI to the clipboard, avoiding a new line at the end
echo | set /p="%uri%" | clip

endlocal
