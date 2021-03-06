/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para efetuar split de um texto
/*******************************************************************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fn_Split](
	@sInputList VARCHAR(8000),
     @sDelimiter VARCHAR(8000) = ','
    )

RETURNS @List TABLE ( item VARCHAR(8000) )
    BEGIN
        DECLARE @sItem VARCHAR(8000)
        WHILE CHARINDEX(@sDelimiter, @sInputList, 0) <> 0
            BEGIN
                SELECT  @sItem = RTRIM(LTRIM(SUBSTRING(@sInputList, 1,
                                                       CHARINDEX(@sDelimiter,
                                                              @sInputList, 0)
                                                       - 1))) ,
                        @sInputList = RTRIM(LTRIM(SUBSTRING(@sInputList,
                                                            CHARINDEX(@sDelimiter,
                                                              @sInputList, 0)
                                                            + LEN(@sDelimiter),
                                                            LEN(@sInputList))))
 
                IF LEN(@sItem) > 0
                    INSERT  INTO @List
                            SELECT  @sItem
            END

        IF LEN(@sInputList) > 0
            INSERT  INTO @List
				SELECT  @sInputList
        RETURN
    END