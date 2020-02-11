/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script para efetuar pagina��o dos dados
/*******************************************************************************************************************************/

--VISUALIZANDO OS REGISTROS DA P�GINA 1 COM 5 LINHAS POR "P�GINA" AT� SQL SERVER 2000,2005 e 2008
DECLARE @PageNumber AS INT, @RowspPage AS INT
SET @PageNumber = 1
SET @RowspPage = 5
SELECT * FROM (
             SELECT ROW_NUMBER() OVER(ORDER BY tbcontatos_id) AS NUMBER,
                    * FROM tbcontatos
               ) AS TBL
WHERE NUMBER BETWEEN ((@PageNumber - 1) * @RowspPage + 1) AND (@PageNumber * @RowspPage)
ORDER BY tbContatos_Nome

--VISUALIZANDO OS REGISTROS DA P�GINA 1 COM 5 LINHAS POR "P�GINA" SQL SERVER 2012 em diante
SELECT * from tbcontatos
ORDER BY tbContatos_Nome OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY; 
