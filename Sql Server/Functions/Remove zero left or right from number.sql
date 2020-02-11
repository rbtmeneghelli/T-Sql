/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para remover os zeros da esquerda ou direita
/*******************************************************************************************************************************/

CREATE FUNCTION dbo.fnRemoveZeros
(@TEXTO AS VARCHAR(30), @DIRECAO BIT)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @RETORNO VARCHAR(30)
    IF @DIRECAO = 0 --Remover zeros a esquerda
     SET @RETORNO = SUBSTRING(@TEXTO,PATINDEX('%[a-z,1-9]%',@TEXTO),LEN(@TEXTO))
    ELSE --Remover zeros a direita
     SET @RETORNO = REVERSE(SUBSTRING(REVERSE(@TEXTO),PATINDEX('%[a-z,1-9]%',REVERSE(@TEXTO)),LEN(@TEXTO)))   
    RETURN (@RETORNO)
END
GO

Depois é só usar no select onde, o primeiro parâmetro é o texto e o segundo e a orientação (0 - Esquerda e 1 - Direita).

DECLARE @TEXTO VARCHAR(30)

--Caso 1
SET @TEXTO = '000001234'
SELECT dbo.fnRemoveZeros(@TEXTO, 0)

--Caso 2
SET @TEXTO = '00100101010110000'
SELECT dbo.fnRemoveZeros(@TEXTO, 1)