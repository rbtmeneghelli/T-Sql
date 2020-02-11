/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para remover todos registros duplicados de uma tabela
/*******************************************************************************************************************************/

With Duplicate as
(
Select *, Row_Number() over (partition by #FIELDWITHDUPLICATEVALUE order By #FIELDWITHDUPLICATEVALUE) as RowNum from #TABLENAME
)

Delete from Duplicate where rownum > 1