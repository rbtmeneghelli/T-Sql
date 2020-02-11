/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para buscar os processos que est�o em execu��o no banco de dados
/*******************************************************************************************************************************/

 select spid, blocked, hostname=left(hostname,20), 
 program_name=left(program_name,20),WaitTime_Seg = convert(int,(waittime/1000)) ,open_tran, 
 case status when 'runnable' then 'Processo em execu��o' when 'sleeping' then 'Processo travado' end as Status
 from master.dbo.sysprocesses where blocked = 0 and SPID in (Select blocked from master.dbo.SYSPROCESSES where blocked >0 ) order by spid 

-- kill + 'Numero Spid'

