/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Procedure para backup de todos os bancos de dados existentes.
/*******************************************************************************************************************************/

create PROCEDURE [dbo].[UserDataBaseBackUp]

	AS BEGIN
	
	SET NOCOUNT ON;

	DECLARE @name VARCHAR(50) -- database name
	DECLARE @path VARCHAR(256) -- path for backup files
	DECLARE @fileName VARCHAR(256) -- filename for backup
	DECLARE @fileDate VARCHAR(20) -- used for file name
	DECLARE @logpath VARCHAR(MAX)

	SET @path = 'c:\'
	SET @logpath = 'C:\temp\'

	SELECT @fileDate = REPLACE(CONVERT(VARCHAR(20),GETDATE(),104),'.','')
	PRINT @fileDate


	DECLARE db_cursor CURSOR FOR
		--SELECT name FROM MASTER.dbo.sysdatabases WHERE name NOT IN ('master','model','msdb','tempdb','ReportServer','ReportServerTempDB')
		SELECT name FROM MASTER.dbo.sysdatabases WHERE name IN ('master')

		OPEN db_cursor FETCH NEXT FROM db_cursor INTO @name
		
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @fileName = @path + @name + '_' + @fileDate + '.BAK'

				BACKUP DATABASE @name TO DISK = @fileName

				BACKUP LOG @name TO DISK = @fileName

				FETCH NEXT FROM db_cursor INTO @name 
			END
		CLOSE db_cursor
	DEALLOCATE db_cursor
END

