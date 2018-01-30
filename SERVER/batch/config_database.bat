@ECHO OFF
echo Using Trusted Connection
osql -E -i batch\config.sql
echo.
echo Restore Database Successful.
echo.
echo IMPORTANT - WRITE THIS DOWN!!!
echo MSSQL Server Authenticaton -
echo User: "Shaiya" Password: "Shaiya123"
echo.
echo Game Admin Account -
echo User: "admin" Password: "admin123"
echo.
PAUSE
@exit