/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Fun��o para contar quantas vezes uma palavra � encontrada em uma determinada string
/*******************************************************************************************************************************/

CREATE FUNCTION CountSearchPat
(
      @Word Varchar(100),
      @String Varchar(Max)
)
RETURNS int
AS
BEGIN
  
      -- Declara��o Vari�veis
      Declare @Count int, @CountWord int
  
      -- Contador de quantas vezes apareceu a palavra
      Set @CountWord = 0
  
      -- Contador do Loop
      Set @Count = 0
  
      -- Loop
      While @Count <= Len(@String)
      Begin
  
            -- Se encontrar a palavra soma mais um para @CountWord
            Set @CountWord =
                  Case When Substring(@String, @Count, Len(@Word)) = @Word
                        Then @CountWord + 1
                        Else @CountWord
                  End
  
            -- Soma mais um ao contador
            Set @Count = @Count + 1
  
      End
  
      -- Retorna Valor
      Return @CountWord
  
END