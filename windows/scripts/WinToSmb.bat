@echo off
setlocal ENABLEDELAYEDEXPANSION

set "inputPath=%~1"

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
