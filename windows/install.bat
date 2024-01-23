REM @echo off
SETLOCAL ENABLEDELAYEDEXPANSION

SET SCRIPT_INSTALL_PATH=%USERPROFILE%\scripts\smb_links
SET SCRIPT_PATH=scripts

REM Check if SCRIPT_INSTALL_PATH exists, create if not
IF NOT EXIST "!SCRIPT_INSTALL_PATH!" (
    MKDIR "!SCRIPT_INSTALL_PATH!" || (
        ECHO Failed to create directory: "!SCRIPT_INSTALL_PATH!"
        EXIT /B 1
    )
)

REM Copy OpenSmbLink.bat to SCRIPT_INSTALL_PATH
COPY /Y "%SCRIPT_PATH%\OpenSmbLink.bat" "%SCRIPT_INSTALL_PATH%" >nul 2>nul || (
    ECHO Failed to copy OpenSmbLink.bat to "!SCRIPT_INSTALL_PATH!".
    EXIT /B 1
)

REM Copy WinToSmb.bat to SCRIPT_INSTALL_PATH
COPY /Y "%SCRIPT_PATH%\WinToSmb.bat" "%SCRIPT_INSTALL_PATH%" >nul 2>nul || (
    ECHO Failed to copy WinToSmb.bat to "!SCRIPT_INSTALL_PATH!".
    EXIT /B 1
)

REM register openSmbLink.bat to open smb uris
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb" /v "URL Protocol" /t REG_SZ /d "" /f >nul 2>nul || EXIT /B 1
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb" /ve /t REG_SZ /d "URL:SMB Protocol" /f >nul 2>nul || EXIT /B 1
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb\DefaultIcon" /ve /t REG_SZ /d "explorer.exe,1" /f >nul 2>nul || EXIT /B 1
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb\shell" /f >nul 2>nul || EXIT /B 1
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb\shell\open" /f >nul 2>nul || EXIT /B 1

REM Set the command for "openSmbLink.bat"
REG ADD "HKEY_CURRENT_USER\Software\Classes\smb\shell\open\command" /ve /t REG_SZ /d "\"!SCRIPT_INSTALL_PATH!\openSmbLink.bat\" \"%%1\"" /f >nul 2>nul || EXIT /B 1


REM register WinToSmb.bat to copy windows paths as smb uris for directories
REM Create the registry path for the context menu entry
REG ADD "HKEY_CURRENT_USER\Software\Classes\directory\shell\copy_uri" /f >nul 2>nul || EXIT /B 1

REM Set the default command to "none" to ensure normal behavior
REG ADD "HKEY_CURRENT_USER\Software\Classes\directory\shell\copy_uri" /ve /t REG_SZ /d "none" /f >nul 2>nul || EXIT /B 1

REM Create the context menu entry "Copy URI" for directories
REG ADD "HKEY_CURRENT_USER\Software\Classes\directory\shell\copy_uri" /ve /t REG_SZ /d "Copy URI" /f >nul 2>nul || EXIT /B 1

REM Set the command for "WinToSmb.bat" for directories
REG ADD "HKEY_CURRENT_USER\Software\Classes\directory\shell\copy_uri\command" /ve /t REG_SZ /d "\"!SCRIPT_INSTALL_PATH!\WinToSmb.bat\" \"%%1\"" /f >nul 2>nul || EXIT /B 1

REM Register WinToSmb.bat for the folder background context menu
REG ADD "HKEY_CURRENT_USER\Software\Classes\directory\Background\shell\copy_uri" /ve /t REG_SZ /d "Copy URI" /f >nul 2>nul || EXIT /B 1
REG ADD "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\copy_uri\command" /ve /t REG_SZ /d "\"!SCRIPT_INSTALL_PATH!\WinToSmb.bat\" \"%%V\"" /f >nul 2>nul || EXIT /B 1


REM register WinToSmb.bat to copy windows paths as smb uris for files
REM Create the registry path for the context menu entry
REG ADD "HKEY_CURRENT_USER\Software\Classes\*\shell\copy_uri" /f >nul 2>nul || EXIT /B 1

REM Create the context menu entry "Copy URI" for files
REG ADD "HKEY_CURRENT_USER\Software\Classes\*\shell\copy_uri" /ve /t REG_SZ /d "Copy URI" /f >nul 2>nul || EXIT /B 1

REM Set the command for "WinToSmb.bat" for files
REG ADD "HKEY_CURRENT_USER\Software\Classes\*\shell\copy_uri\command" /ve /t REG_SZ /d "\"!SCRIPT_INSTALL_PATH!\WinToSmb.bat\" \"%%1\"" /f >nul 2>nul || EXIT /B 1


REM Clean up and exit
ENDLOCAL
EXIT /B 0

