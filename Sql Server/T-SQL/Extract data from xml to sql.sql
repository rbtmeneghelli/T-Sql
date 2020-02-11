/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Script de extração de dados XML para o banco de dados
/*******************************************************************************************************************************/

DECLARE @XML XML
SET @XML = (SELECT CAST(BulkColumn AS XML) FROM OPENROWSET(BULK N 'C:\Arquivo.xml', SINGLE_BLOB)
AS Arquivo)
;WITH XMLNAMESPACES(DEFAULT ‘http://;)
SELECT NFe.value('cUF[1]', 'int') AS cUF
       NFe.value('cNF[1]', 'int') AS cNF
       NFe.value('../emit[1]/CNPJ[1]','varchar(20)') AS CNPJ
       NFe.value('../emit[1]/enderEmit[1]/xBairro[1]','varchar(max)') AS xBairro
FROM @XML.nodes('//infNFe/ide') AS NFes(NFe)