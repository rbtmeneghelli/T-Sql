/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para recuperar o banco de dados do modo suspeito
/*******************************************************************************************************************************/
 
SELECT
    Name, State_Desc
FROM
    sys.databases
WHERE
    State_Desc ='Online'

DBCC CHECKDB('HISTOSMART')

-- Coloca o database em modo de emergência
ALTER DATABASE ALAN_TESTE SET EMERGENCY
GO
-- Realiza um check do database
DBCC CHECKDB('ALAN_TESTE')
GO
-- Altera o database para SINGLE_USER, ou seja, só um usuário pode estar conectado
ALTER DATABASE ALAN_TESTE SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
-- Realiza o comando para reparo do database
DBCC CHECKDB('ALAN_TESTE', REPAIR_ALLOW_DATA_LOSS) WITH NO_INFOMSGS, ALL_ERRORMSGS
GO
-- Volta a base de dados para multiplos usuários
ALTER DATABASE ALAN_TESTE SET MULTI_USER
GO
-- Restarta o status do database
EXEC sp_resetstatus 'ALAN_TESTE'