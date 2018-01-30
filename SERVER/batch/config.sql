
/* Add server link, and Shaiya username */
IF NOT EXISTS (SELECT [name] FROM master.dbo.syslogins WHERE name = 'Shaiya')
BEGIN
	EXEC sp_addlogin 'Shaiya', 'Shaiya123', 'PS_GameDefs';
END	
EXEC sp_addsrvrolemember 'Shaiya', 'sysadmin';

IF NOT EXISTS (SELECT srvname FROM master..sysservers WHERE srvname='game')
BEGIN
	EXEC sp_addlinkedserver 'game','','SQLOLEDB','127.0.0.1';
	EXEC sp_addlinkedsrvlogin 'game','false',null,'Shaiya','Shaiya123';
END

exec sp_serveroption @server='game', @optname='rpc', @optvalue='true';
exec sp_serveroption @server='game', @optname='rpc out', @optvalue='true';

--exec PS_UserData.dbo.usp_Create_ShaiyaAccount 1, 'admin', admin123

/* Add to Game User: admin, Password: admin123 */
IF NOT EXISTS (SELECT UserUID FROM PS_UserData.dbo.Users_Master WHERE UserUID=1)
BEGIN
	INSERT INTO PS_UserData.dbo.Users_Master
	(UserUID, UserID, Pw, JoinDate, Admin, AdminLevel, UseQueue, Status, Leave, LeaveDate, UserType, UserIp, ModiIp, ModiDate, Point, Enpassword, Birth)
	VALUES (1,'admin', 'admin123', GETDATE(), 1, 255,'',16,'', DATEADD(year, +10, GETDATE()),'A',NULL,NULL,NULL,0,NULL,NULL);
END

