/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para retornar todas as procedures existentes no banco de dados
/*******************************************************************************************************************************/

   SELECT [Procedure Name] = ir.ROUTINE_NAME,[Parameter Name] = COALESCE(ip.PARAMETER_NAME, '<no params>'),[Data Type] = COALESCE(UPPER(ip.DATA_TYPE) + CASE
   WHEN ip.DATA_TYPE IN ('NUMERIC', 'DECIMAL') THEN
   '(' + CAST(ip.NUMERIC_PRECISION AS VARCHAR) + ', ' + CAST(ip.NUMERIC_SCALE AS VARCHAR) + ')'
   WHEN RIGHT(ip.DATA_TYPE, 4) = 'CHAR' THEN
   '(' + CAST(ip.CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
   ELSE '' END + CASE ip.PARAMETER_MODE
   WHEN 'INOUT' THEN ' OUTPUT' ELSE ' ' END, '-')
   FROM INFORMATION_SCHEMA.ROUTINES ir LEFT OUTER JOIN INFORMATION_SCHEMA.PARAMETERS ip ON ir.ROUTINE_NAME = ip.SPECIFIC_NAME
   WHERE ir.ROUTINE_TYPE = 'PROCEDURE' AND COALESCE(OBJECTPROPERTY(OBJECT_ID(ip.SPECIFIC_NAME),'IsMsShipped'), 0) = 0
   ORDER BY ir.ROUTINE_NAME,ip.ORDINAL_POSITION

