/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para pegar a quantidade de registros de todas as tabelas do banco de dados
/*******************************************************************************************************************************/

SELECT OBJECT_NAME(object_id) as Tabela,Sum(row_count) as row_count FROM sys.dm_db_partition_stats 
WHERE index_id IN(0,1) AND OBJECTPROPERTYEX(object_id,'IsSystemTable') = 0 GROUP BY object_id 
ORDER BY row_count DESC
