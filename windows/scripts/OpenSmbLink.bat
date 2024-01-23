@echo off
setlocal ENABLEDELAYEDEXPANSION

rem Get the SMB URI argument
set "uri=%~1"

rem Check if the URI starts with "smb://"
if /I "!uri:~0,6!" neq "smb://" (
    echo Invalid SMB URI. The URI must start with "smb://".
    exit /b 1
)

rem Remove the "smb://" prefix
set "uri=!uri:~6!"

rem Replace forward slashes with backslashes
set "uri=!uri:/=\!"

rem Replace %20 with spaces
set "uri=!uri:%%20= !"

rem DEBUG output
echo Opening Explorer for SMB URI: \\!uri!

rem Open Windows Explorer with the converted path
rem Using /select to only select the item without opening it
explorer.exe /select,\\!uri!

endlocal

