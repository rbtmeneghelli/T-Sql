/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 04/12/2025
-- Description: Script para obter o tamanho do log da base de dados
/*******************************************************************************************************************************/
dbcc sqlperf(logspace)

select name, log_reuse_wait_desc from sys.databases where
name = 'WebNotesAPI'
