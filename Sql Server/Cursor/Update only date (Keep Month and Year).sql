/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Cursor para atualizar o dia de uma determinada data, sem afetar o mês e o ano.
/*******************************************************************************************************************************/

DECLARE @ANO VARCHAR(4),
@MES VARCHAR(2),
@DIA VARCHAR(2),
@DATA VARCHAR(10),
@DATAVENCIMENTO DATETIME

DECLARE @TBFINCONTASPAGAR_ID BIGINT

-- Cursor para percorrer os nomes dos objetos 
DECLARE cursor_objects CURSOR FOR
	SELECT TBFINCONTASPAGAR_VENCIMENTO, tbFINContasPagar_ID FROM tbFINContasPagar WHERE TBFORNECEDORES_ID = 425
	
-- Abrindo Cursor para leitura
OPEN cursor_objects

-- Lendo a próxima linha
FETCH NEXT FROM cursor_objects INTO @DATAVENCIMENTO,@TBFINCONTASPAGAR_ID

-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN
	
    SET @ANO = CONVERT(VARCHAR,DATEPART ( YEAR , @DATAVENCIMENTO))
    SET @MES = CONVERT(VARCHAR,DATEPART ( MONTH ,@DATAVENCIMENTO))
	SET @DIA = '20';

	SET @DATA = @DIA + '/' + @MES + '/' + @ANO
	
	UPDATE tbFINContasPagar_TMP SET TBFINCONTASPAGAR_VENCIMENTO = @DATA WHERE tbFINContasPagar_ID = @TBFINCONTASPAGAR_ID AND TBFORNECEDORES_ID = 425
	
    -- Lendo a próxima linha
    FETCH NEXT FROM cursor_objects INTO @DATAVENCIMENTO,@TBFINCONTASPAGAR_ID
END

-- Fechando Cursor para leitura
CLOSE cursor_objects

-- Desalocando o cursor
DEALLOCATE cursor_objects 

SELECT TOP 1000 TBFINCONTASPAGAR_VENCIMENTO FROM tbFINContasPagar WHERE TBFORNECEDORES_ID = 425
-- SELECT TOP 1000 TBFINCONTASPAGAR_VENCIMENTO FROM tbFINContasPagar_TMP WHERE TBFORNECEDORES_ID = 425


