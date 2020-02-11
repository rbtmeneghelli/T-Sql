/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para recuperar o banco de dados do modo suspeito
/*******************************************************************************************************************************/

EXEC sp_resetstatus 'smart';
ALTER DATABASE smart SET EMERGENCY
DBCC checkdb('smart')
ALTER DATABASE smart SET SINGLE_USER WITH ROLLBACK IMMEDIATE

