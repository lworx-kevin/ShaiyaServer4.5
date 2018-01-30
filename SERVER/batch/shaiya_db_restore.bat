@ECHO OFF
ECHO.> temp.sql

ECHO RESTORE DATABASE PS_Billing FROM DISK = '%~dpf1\PS_Billing' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_Billing_Data' TO 'D:\SHAIYA_SERVER\DATABASE\PS_Billing.mdf',>> temp.sql
ECHO MOVE 'PS_Billing_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_Billing.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameData FROM DISK = '%~dpf1\PS_GameData' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameData_Data' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameData.mdf',>> temp.sql
ECHO MOVE 'PS_GameData_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameData.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameLog FROM DISK = '%~dpf1\PS_GameLog' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameLog_Data' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameLog.mdf',>> temp.sql
ECHO MOVE 'PS_GameLog_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameLog.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GMTool FROM DISK = '%~dpf1\PS_GMTool' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GMTool_Data' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GMTool.mdf',>> temp.sql
ECHO MOVE 'PS_GMTool_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GMTool.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameDefs FROM DISK = '%~dpf1\PS_GameDefs' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameDefs_Dat' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameDefs.mdf',>> temp.sql
ECHO MOVE 'PS_GameDefs_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_GameDefs.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_UserData FROM DISK = '%~dpf1\PS_UserData' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_UserData_Data' TO 'D:\SHAIYA_SERVER\DATABASE\PS_UserData.mdf',>> temp.sql
ECHO MOVE 'PS_UserData_Log' TO 'D:\SHAIYA_SERVER\DATABASE\PS_UserData.ldf';>> temp.sql

CLS
osql -E -i temp.sql
DEL temp.sql
PAUSE
@exit