/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para buscar os processos que estão em execução no banco de dados
/*******************************************************************************************************************************/

 select spid, blocked, hostname=left(hostname,20), 
 program_name=left(program_name,20),WaitTime_Seg = convert(int,(waittime/1000)) ,open_tran, 
 case status when 'runnable' then 'Processo em execução' when 'sleeping' then 'Processo travado' end as Status
 from master.dbo.sysprocesses where blocked = 0 and SPID in (Select blocked from master.dbo.SYSPROCESSES where blocked >0 ) order by spid 

-- kill + 'Numero Spid'

