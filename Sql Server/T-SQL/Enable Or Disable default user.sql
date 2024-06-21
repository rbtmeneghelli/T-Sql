-- Esse script faz o usuário "sa" ser ativado e ter sua senha trocada
ALTER LOGIN sa ENABLE;
GO
ALTER LOGIN sa WITH PASSWORD = '#############';
GO

-- Esse script faz que o usuário padrão seja desativado
ALTER LOGIN [Domain\user] DISABLE
