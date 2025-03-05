-- A função LAG() permite acessar um valor armazenado em uma linha acima da linha atual. 
-- A linha acima pode ser adjacente ou algum número de linhas acima, conforme ordenado por uma coluna ou conjunto de colunas especificado.

select *, LAG(Id) OVER(ORDER BY Id) as ID_ANTERIOR from LegalRecourseType

-- A função LEAD() é semelhante a LAG(). Enquanto LAG() acessa um valor armazenado em uma linha acima, LEAD() acessa um valor armazenado em uma linha abaixo.

select *, LEAD(Id) OVER(ORDER BY Id) as ID_PROXIMO from LegalRecourseType

-- Exemplo para comparar os valores de vendas anuais ao longo dos anos
--SELECT  ano, venda_total_atual,
--   LAG(venda_total) OVER(ORDER BY ano) AS venda_total_anterior,
--   venda_total - LAG(venda_total) OVER(ORDER BY ano) AS diferença
--FROM venda_anual;

-- Referencia >> https://learnsql.com.br/blog/funcoes-lag-e-lead-em-sql/
-- Essas funcionalidades são de extrema importancia para relatorios