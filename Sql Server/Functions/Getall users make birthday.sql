/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para retornar os aniversariantes do mês.
/*******************************************************************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_birthday]()
returns table
as 
return(
select tbContatos_Id, Nome = tbContatos_Nome,Data = tbContatos_DataAniversario from tbcontatos
where isnull(tbContatos_DataAniversario,'') != '' and
month(Convert(datetime,tbContatos_DataAniversario,103)) = month(getdate())    
)