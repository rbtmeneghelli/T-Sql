/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para efetuar split de um texto
/*******************************************************************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_Splitt](
 @String nvarchar (4000),
 @Delimiter nvarchar (10)
 )
returns @ValueTable table ([Value] nvarchar(4000))
begin
 declare @NextString nvarchar(4000)
 declare @Pos int
 declare @NextPos int
 declare @CommaCheck nvarchar(1)
 
 if @String <> '' 
 begin
	 --Initialize
	 set @NextString = ''
	 set @CommaCheck = right(@String,1) 
 
	 --Check for trailing Comma, if not exists, INSERT
	 --if (@CommaCheck <> @Delimiter )
	 set @String = @String + @Delimiter
 
	 --Get position of first Comma
	 set @Pos = charindex(@Delimiter,@String)
	 set @NextPos = 1
 
	 --Loop while there is still a comma in the String of levels
	 while (@pos <>  0)  
	 begin
	 	set @NextString = substring(@String,1,@Pos - 1)
 
	 	insert into @ValueTable ( [Value]) Values (@NextString)
 
	  	set @String = substring(@String,@pos +1,len(@String))
  
	  	set @NextPos = @Pos
	  	set @pos  = charindex(@Delimiter,@String)
	 end
 end
 
 return
end