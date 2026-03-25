/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 04/12/2025
-- Description: Script para obter a ultima data corrente do mes
/*******************************************************************************************************************************/

SELECT EOMONTH(GETDATE()) as LastCurrentMonthDay