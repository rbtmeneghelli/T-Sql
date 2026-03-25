/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 25/03/2026
-- Description: Script para obter a quantidade ou valor total, filtrando por condição
/*******************************************************************************************************************************/

SELECT 
    COUNT(CASE WHEN centro_custo_id = 2 THEN 1 END) AS QtdeRegistrosReceitas,
    SUM(CASE WHEN centro_custo_id = 7 THEN valor ELSE 0 END) AS ValorTotalReceita,
    COUNT(CASE WHEN centro_custo_id = 3 THEN 1 END) AS QtdeRegistrosDespesas,
    SUM(CASE WHEN centro_custo_id = 3 THEN valor ELSE 0 END) AS ValorTotalDespesa,
    COUNT(CASE WHEN centro_custo_id IN (4,6) THEN 1 END) AS QtdeRegistrosCompras,
    SUM(CASE WHEN centro_custo_id IN (4,6) THEN valor ELSE 0 END) AS ValorTotalCompra
FROM Lancamento;
