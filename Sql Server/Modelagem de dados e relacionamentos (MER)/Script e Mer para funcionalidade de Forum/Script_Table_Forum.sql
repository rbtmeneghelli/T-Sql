SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Forum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Descricao] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [IdUsuarioCadastro]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [IdUsuarioAlteracao]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [IdUsuarioExclusao]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [DataCadastro]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO

ALTER TABLE [dbo].[Forum] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO


