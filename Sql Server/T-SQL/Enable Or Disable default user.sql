-- Esse script faz o usu�rio "sa" ser ativado e ter sua senha trocada
ALTER LOGIN sa ENABLE;
GO
ALTER LOGIN sa WITH PASSWORD = '#############';
GO

-- Esse script faz que o usu�rio padr�o seja desativado
ALTER LOGIN [Domain\user] DISABLE
