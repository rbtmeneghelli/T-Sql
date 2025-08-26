CREATE OR ALTER FUNCTION dbo.fnTempoDecorrido (@data DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN
  
  DECLARE @GETDATE DATETIME = SYSDATETIMEOFFSET() AT TIME ZONE 'E. South America Standard Time'
  
  IF @data IS NULL RETURN N'sem data';

  DECLARE @m  INT = DATEDIFF(MINUTE, @data, @GETDATE);
  IF @m < 0 SET @m = 0;

  IF @m < 60
    RETURN CAST(@m AS NVARCHAR(10)) + CASE WHEN @m = 1 THEN N' minuto atr�s' ELSE N' minutos atr�s' END;

  DECLARE @h INT = DATEDIFF(HOUR, @data, @GETDATE);
  IF @h < 24
    RETURN CAST(@h AS NVARCHAR(10)) + CASE WHEN @h = 1 THEN N' hora atr�s' ELSE N' horas atr�s' END;

  DECLARE @d INT = DATEDIFF(DAY, @data, @GETDATE);
  IF @d < 30
    RETURN CAST(@d AS NVARCHAR(10)) + CASE WHEN @d = 1 THEN N' dia atr�s' ELSE N' dias atr�s' END;

  DECLARE @mo INT = DATEDIFF(MONTH, @data, @GETDATE);
  IF @mo < 12
    RETURN CAST(@mo AS NVARCHAR(10)) + CASE WHEN @mo = 1 THEN N' m�s atr�s' ELSE N' meses atr�s' END;

  DECLARE @y INT = DATEDIFF(YEAR, @data, @GETDATE);
  RETURN CAST(@y AS NVARCHAR(10)) + CASE WHEN @y = 1 THEN N' ano atr�s' ELSE N' anos atr�s' END;
END
GO