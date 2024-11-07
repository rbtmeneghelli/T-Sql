CREATE FUNCTION dbo.fn_string_agg
(
    @Tabela NVARCHAR(MAX),  -- Nome da tabela ou da coluna que será concatenada
    @Coluna NVARCHAR(MAX),  -- Nome da coluna que vai ser agregada
    @Separador NVARCHAR(10) = ','  -- Separador entre os valores
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Resultado NVARCHAR(MAX)

    -- Usando FOR XML PATH para concatenar os valores
    SELECT @Resultado = STRING_AGG(CAST([@Coluna] AS NVARCHAR(MAX)), @Separador)
    FROM [dbo].[Tabela]
    
    -- Retornando o resultado concatenado
    RETURN @Resultado
END
