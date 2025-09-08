SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ForumTopico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NULL,
	[NomeUsuarioCadastro] [varchar](150) NULL,
	[DataCadastro] [datetime] NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[NomeUsuarioAlteracao] [varchar](150) NULL,
	[DataAlteracao] [datetime] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[NomeUsuarioExclusao] [varchar](150) NULL,
	[DataExclusao] [datetime] NULL,
	[IdForum] [int] NOT NULL,
	[IdForumTopicoStatus] [int] NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[Descricao] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [IdUsuarioCadastro]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [DataCadastro]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [IdUsuarioAlteracao]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [IdUsuarioExclusao]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO

ALTER TABLE [dbo].[ForumTopico] ADD  DEFAULT (NULL) FOR [IdForumTopicoAvaliador]
GO

ALTER TABLE [dbo].[ForumTopico]  WITH CHECK ADD FOREIGN KEY([IdForum])
REFERENCES [dbo].[Forum] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ForumTopico]  WITH CHECK ADD FOREIGN KEY([IdForumTopicoStatus])
REFERENCES [dbo].[ForumTopicoStatus] ([Id])
GO


