@ECHO OFF
SET dir_installer=%~dp0

title Restore Shaiya Databases - WARNING: DO NOT CLOSE WINDOW!
if exist ..\DATABASE goto SQL_RESTORE
mkdir "..\DATABASE"
echo.

:SQL_RESTORE
echo Restore Database
start /WAIT batch\shaiya_db_restore PSM_Data
start /WAIT batch\config_database.bat

echo Start MSTDC and set to auto.
sc config MSDTC start= auto
sc start MSDTC

echo Shaiya Services
start /WAIT batch\shaiya_svc_register.bat "%dir_installer%"

echo Agent Install
::start /WAIT PSM_Client\PSM_AgentInstall.exe
start /WAIT PSM_Server\PSMServer_Mgr.exe

echo This will now restart Windows.
PAUSE
shutdown -r -f -t 0
