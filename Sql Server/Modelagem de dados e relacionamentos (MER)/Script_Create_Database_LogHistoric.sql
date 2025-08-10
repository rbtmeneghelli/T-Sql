-- Abordagem com uma unica tabela...
CREATE TABLE HistoricoRegistros (
    IdHistorico BIGINT IDENTITY(1,1) PRIMARY KEY,
	NomeTabela NVARCHAR(100) NOT NULL,      -- Qual tabela foi alterada
    IdRegistroAlterado BIGINT NOT NULL,     -- ID do registro na tabela original
    TipoOperacao NVARCHAR(10) NOT NULL,     -- INSERT, UPDATE, DELETE
    ValoresAntes NVARCHAR(MAX) NULL,        -- Estado antes da alteração (JSON ou texto)
    ValoresDepois NVARCHAR(MAX) NULL,       -- Estado depois da alteração (JSON ou texto)
	IdUsuario BIGINT NOT NULL,				-- ID do usuario
    Usuario NVARCHAR(100) NOT NULL,			-- Nome do Usuário
    IpUsuario NVARCHAR(50) NULL,			-- IP da maquina do usuario
    HostnameUsuario NVARCHAR(200) NULL,		-- O HOSTNAME da maquina do usuario
    DataOperacao DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

-- Índices para consultas frequentes
CREATE INDEX IX_HistoricoRegistros_Tabela_Registro
    ON HistoricoRegistros (NomeTabela, IdRegistroAlterado);

CREATE INDEX IX_HistoricoRegistross_Data
    ON HistoricoRegistros (DataOperacao DESC);

CREATE INDEX IX_HistoricoRegistross_IdUsuario
    ON HistoricoRegistros (IdUsuario);

-- Abordagem com duas tabelas...
CREATE TABLE HistoricoRegistros (
    IdHistorico BIGINT IDENTITY(1,1) PRIMARY KEY,
    NomeTabela NVARCHAR(100) NOT NULL,
    IdRegistroAlterado BIGINT NOT NULL,
    TipoOperacao NVARCHAR(10) NOT NULL,
    IdUsuario BIGINT NOT NULL,				-- ID do usuario
    Usuario NVARCHAR(100) NOT NULL,			-- Nome do Usuário
    IpUsuario NVARCHAR(50) NULL,			-- IP da maquina do usuario
    HostnameUsuario NVARCHAR(200) NULL,		-- O HOSTNAME da maquina do usuario
    DataOperacao DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

-- Índices para consultas frequentes
CREATE INDEX IX_HistoricoRegistros_Tabela_Registro
    ON HistoricoRegistros (NomeTabela, IdRegistroAlterado);

CREATE INDEX IX_HistoricoRegistross_Data
    ON HistoricoRegistros (DataOperacao DESC);

CREATE INDEX IX_HistoricoRegistross_IdUsuario
    ON HistoricoRegistros (IdUsuario);

CREATE TABLE HistoricoDetalhes (
    IdDetalhe BIGINT IDENTITY(1,1) PRIMARY KEY,
    IdHistorico BIGINT NOT NULL FOREIGN KEY REFERENCES HistoricoRegistros(IdHistorico) ON DELETE CASCADE,
    ValoresAntes NVARCHAR(MAX) NULL,
    ValoresDepois NVARCHAR(MAX) NULL
);

-- Índice para junções rápidas
CREATE INDEX IX_HistoricoDetalhes_IdEvento
    ON HistoricoDetalhes (IdHistorico);

-- Procedure para excluir losAntigos (apagar automaticamente histórico mais antigo que 3 anos)
CREATE PROCEDURE LimparHistoricoAntigo
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DataLimite DATETIME2 = DATEADD(YEAR, -3, SYSUTCDATETIME());

    DELETE FROM HistoricoDetalhes
    WHERE IdHistorico IN (
        SELECT IdHistorico FROM HistoricoRegistros WHERE DataOperacao < @DataLimite
    );

    DELETE FROM HistoricoRegistros
    WHERE DataOperacao < @DataLimite;
END;
GO

-- Agendar no SQL Server Agent para rodar mensalmente:
-- EXEC LimparHistoricoAntigo;
