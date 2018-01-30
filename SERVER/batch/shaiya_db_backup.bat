@ECHO OFF
echo.> temp.sql
echo BACKUP DATABASE PS_Billing TO DISK='%~dpf1\PS_Billing' WITH FORMAT; >> temp.sql
echo BACKUP DATABASE PS_GameData TO DISK='%~dpf1\PS_GameData' WITH FORMAT; >> temp.sql
echo BACKUP DATABASE PS_GameDefs TO DISK='%~dpf1\PS_GameDefs' WITH FORMAT; >> temp.sql
echo BACKUP DATABASE PS_GameLog TO DISK='%~dpf1\PS_GameLog' WITH FORMAT; >> temp.sql
echo BACKUP DATABASE PS_GMTool TO DISK='%~dpf1\PS_GMTool' WITH FORMAT; >> temp.sql
echo BACKUP DATABASE PS_UserData TO DISK='%~dpf1\PS_UserData' WITH FORMAT; >> temp.sql
osql -E -i temp.sql
DEL temp.sql
PAUSE
@exit
