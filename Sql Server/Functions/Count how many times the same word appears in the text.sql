/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para contabilizar quantas vezes a mesma palavra aparece num texto
/*******************************************************************************************************************************/

CREATE FUNCTION F_CONTADOR
( @fEntrada VARCHAR(8000), @fLocaliza VARCHAR(100) )
RETURNS INT
BEGIN
 
RETURN (LEN(@fEntrada) -
 LEN(REPLACE(@fEntrada, @fLocaliza, ''))) /
 LEN(@fLocaliza)
 
END
GO;