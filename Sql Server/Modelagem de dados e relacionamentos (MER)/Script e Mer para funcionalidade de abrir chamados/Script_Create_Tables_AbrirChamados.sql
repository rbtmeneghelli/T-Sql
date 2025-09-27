-- ==========================================
-- TABELA: Solicitante
-- ==========================================
CREATE TABLE Solicitante (
    SolicitanteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(150) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Instituicao NVARCHAR(150),
    AreaAtuacao NVARCHAR(100),
    Cargo NVARCHAR(100)
);
GO

-- ==========================================
-- TABELA: Especialista
-- ==========================================
CREATE TABLE Especialista (
    EspecialistaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(150) NOT NULL
);
GO

-- ==========================================
-- TABELA: CategoriaChamado
-- ==========================================
CREATE TABLE CategoriaChamado (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Descricao NVARCHAR(100) NOT NULL
);
GO

-- ==========================================
-- TABELA: StatusChamado
-- ==========================================
CREATE TABLE StatusChamado (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    Descricao NVARCHAR(100) NOT NULL
);
GO

-- ==========================================
-- TABELA: TipoSla
-- ==========================================
CREATE TABLE TipoSla (
    TipoSlaID INT IDENTITY(1,1) PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL,
    TempoRespostaHoras INT NOT NULL,
    TempoResolucaoHoras INT NOT NULL,
);
GO

-- ==========================================
-- TABELA: Chamado
-- ==========================================
CREATE TABLE Chamado (
    ChamadoID INT IDENTITY(1,1) PRIMARY KEY,
    SolicitanteID INT NOT NULL,
    EspecialistaID INT NOT NULL,
    CategoriaID INT NOT NULL,
    StatusID INT NOT NULL,
	TipoSlaID INT NOT NULL,
    Titulo NVARCHAR(200) NOT NULL,
    Descricao NVARCHAR(MAX),
    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
    DataFechamento DATETIME NULL,
    CONSTRAINT FK_Chamado_Solicitante FOREIGN KEY (SolicitanteID) REFERENCES Solicitante(SolicitanteID),
    CONSTRAINT FK_Chamado_Especialista FOREIGN KEY (EspecialistaID) REFERENCES Especialista(EspecialistaID),
    CONSTRAINT FK_Chamado_Categoria FOREIGN KEY (CategoriaID) REFERENCES CategoriaChamado(CategoriaID),
    CONSTRAINT FK_Chamado_Status FOREIGN KEY (StatusID) REFERENCES StatusChamado(StatusID),
	CONSTRAINT FK_Chamado_TipoSla FOREIGN KEY (TipoSlaID) REFERENCES TipoSla(TipoSlaID),
);
GO

-- ==========================================
-- TABELA: Arquivo
-- ==========================================
CREATE TABLE Arquivo (
    ArquivoID INT IDENTITY(1,1) PRIMARY KEY,
    ChamadoID INT NOT NULL,
    NomeArquivo NVARCHAR(200) NOT NULL,
    CaminhoArquivo NVARCHAR(500) NOT NULL,
    DataUpload DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Arquivo_Chamado FOREIGN KEY (ChamadoID) REFERENCES Chamado(ChamadoID)
);
GO

-- ==========================================
-- TABELA: EmailNotificacao
-- ==========================================
CREATE TABLE EmailNotificacao (
    EmailID INT IDENTITY(1,1) PRIMARY KEY,
    ChamadoID INT NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    CONSTRAINT FK_EmailNotificacao_Chamado FOREIGN KEY (ChamadoID) REFERENCES Chamado(ChamadoID)
);
GO

-- ==========================================
-- TABELA: Comunicação
-- ==========================================
CREATE TABLE Comunicacao (
    ComunicacaoID INT IDENTITY(1,1) PRIMARY KEY,
    ChamadoID INT NOT NULL,
    RemetenteTipo NVARCHAR(20) NOT NULL CHECK (RemetenteTipo IN ('Solicitante', 'Especialista')),
    RemetenteSolicitanteID INT NULL,
    RemetenteEspecialistaID INT NULL,
    Mensagem NVARCHAR(MAX) NOT NULL,
    DataEnvio DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Comunicacao_Chamado FOREIGN KEY (ChamadoID) REFERENCES Chamado(ChamadoID),
    CONSTRAINT FK_Comunicacao_Solicitante FOREIGN KEY (RemetenteSolicitanteID) REFERENCES Solicitante(SolicitanteID),
    CONSTRAINT FK_Comunicacao_Especialista FOREIGN KEY (RemetenteEspecialistaID) REFERENCES Especialista(EspecialistaID)
);
GO