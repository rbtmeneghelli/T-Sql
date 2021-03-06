/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Exemplo de cursor com PostgreSQL
/*******************************************************************************************************************************/

USE [DATABASE]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[FDIA_SEMANA_EXT]  (@DATA DATETIME) RETURNS VARCHAR (20)  AS
BEGIN
  DECLARE @DIA INT,
   @DIA_EXT VARCHAR(20)
  SELECT @DIA = (DATEPART(DW,@DATA ))
   IF @DIA=1 
    SET @DIA_EXT ='DOMINGO'
  IF @DIA=2  
     SET @DIA_EXT ='SEGUNDA-FEIRA'
  IF @DIA=3  
     SET @DIA_EXT ='TERÇA-FEIRA'
  IF @DIA=4  
     SET @DIA_EXT ='QUARTA-FEIRA'
  IF @DIA=5  
     SET @DIA_EXT ='QUINTA-FEIRA'
  IF @DIA=6  
     SET @DIA_EXT ='SEXTA-FEIRA'
  IF @DIA=7  
     SET @DIA_EXT ='SÁBADO'
   RETURN @DIA_EXT
END