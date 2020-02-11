/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Trigger para gravar a ação feita pelo usuario na tabela de log.
/*******************************************************************************************************************************/

CREATE TABLE [dbo].[TesteTrigger_Log](Operacao VARCHAR(50),session_id [smallint] NOT NULL,[login_name] [nvarchar](128) NOT NULL,hostname VARCHAR(200),[start_time] [datetime] NOT NULL,[program_name] [nvarchar](128) NULL,[Query] [nvarchar](max) NULL,Id_TesteTrigger [int] NOT NULL — chave primaria da tabela) ON [PRIMARY]

CREATE TRIGGER [dbo].[trgTesteTrigger]ON [dbo].[TABLEWHERETRIGGERWILLBEUSED]
FOR UPDATE, DELETE , INSERT
AS BEGIN
SET NOCOUNT ON;
DECLARE @Id_TesteTrigger INT, @Tp_Alteracao VARCHAR(50)
CREATE TABLE #log(eventtype VARCHAR(MAX),parameters int,text VARCHAR(MAX))
INSERT INTO #log
EXEC(‘DBCC INPUTBUFFER(@@spid)’)
if not exists(select top 1 null from inserted) –deleted
begin
select @Tp_Alteracao = ‘DELETE’, @Id_TesteTrigger =Id_TesteTrigger
from deleted
end
else if not exists(select top 1 null from deleted) –inserted
begin
select @Tp_Alteracao =’INSERT’,@Id_TesteTrigger =Id_TesteTrigger
from inserted
end
else
begin –update
select @Tp_Alteracao =’UPDATE’,@Id_TesteTrigger =Id_TesteTrigger
from deleted
end
INSERT INTO TesteTrigger_Log(Operacao,session_id,login_name,hostname,start_time, program_name,Query,Id_TesteTrigger)
SELECT @Tp_Alteracao,A.session_id,login_name,host_name,B.start_time, program_name,
(SELECT text FROM #log) QueryAtual,@Id_TesteTrigger
from sys.dm_exec_sessions A
JOIN sys.dm_exec_requests B on A.session_id = B.session_id
JOIN sys.dm_exec_connections C on B.session_id = C.session_id
where A.session_id = @@spid
END

