USE [master]
GO
CREATE DATABASE [CONTROLE_ACESSO]
GO
USE [CONTROLE_ACESSO]
GO
/****** Object:  Table [dbo].[ControleAcesso_Acao]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_Acao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Descricao] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_Funcionalidade]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_Funcionalidade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[DescricaoSimplificada] [varchar](50) NULL,
	[IdMenu] [int] NULL,
	[MostrarBackOffice] [bit] NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_FuncionalidadeAcao]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_FuncionalidadeAcao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[IdFuncionalidade] [int] NOT NULL,
	[IdAcao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[IdPerfil] [int] NOT NULL,
	[IdFuncionalidadeAcao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_HistoricoSenhaUsuario]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[HashSenha] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_Menu]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Exibir] [bit] NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[DescricaoToolTip] [varchar] (100) NOT NULL,
	[Icone] [varchar](50) NULL,
	[Link] [varchar](200) NULL,
	[Ordem] [int] NOT NULL,
	[IdMenuPai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_Perfil]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Descricao] [varchar](100) NOT NULL,
	[Editavel] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_Usuario]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Nome] [varchar](200) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Senha] [varchar](100) NULL,
	[Cpf] [varchar](11) NULL,
	[Cnpj] [varchar](14) NULL,
	[CodigoCadastrarSenha] [varchar](300) NULL,
	[AceitePoliticasDeUsoWeb] [bit] NOT NULL,
	[Editavel] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControleAcesso_UsuarioPerfil]    Script Date: 08/07/2025 14:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControleAcesso_UsuarioPerfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[IdUsuarioExclusao] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[DataExclusao] [datetime] NULL,
	[Editavel] [bit] NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_Acao] ON 

INSERT [dbo].[ControleAcesso_Acao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Descricao]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.563' AS DateTime), NULL, NULL, N'Consultar')
INSERT [dbo].[ControleAcesso_Acao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Descricao]) VALUES (2, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.563' AS DateTime), NULL, NULL, N'Cadastrar')
INSERT [dbo].[ControleAcesso_Acao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Descricao]) VALUES (3, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.563' AS DateTime), NULL, NULL, N'Editar')
INSERT [dbo].[ControleAcesso_Acao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Descricao]) VALUES (4, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.563' AS DateTime), NULL, NULL, N'Deletar')
SET IDENTITY_INSERT [dbo].[ControleAcesso_Acao] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_Funcionalidade] ON 

INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (1, N'Usuários', NULL, 2, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (2, N'Perfil de acesso', NULL, 3, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (3, N'Fórum Comunidade Associado', NULL, 5, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (4, N'Fórum Comissões Técnicas', NULL, 6, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (5, N'Fórum Grupo de Trabalho', NULL, 7, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (6, N'News', NULL, 9, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (7, N'Atas', NULL, 11, 1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ControleAcesso_Funcionalidade] ([Id], [Descricao], [DescricaoSimplificada], [IdMenu], [MostrarBackOffice], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao]) VALUES (8, N'Acesso BackOffice', NULL, 4, 0, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ControleAcesso_Funcionalidade] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ON 

INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (2, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (3, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (4, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 2, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (5, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 2, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (6, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 2, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (7, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 3, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (8, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 3, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (9, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 3, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (10, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 4, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (11, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 4, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (12, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 4, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (13, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 5, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (14, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 5, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (15, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 5, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (16, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 6, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (17, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 6, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (18, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 6, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (19, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 7, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (20, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 7, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (21, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 7, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdFuncionalidade], [IdAcao]) VALUES (22, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 8, 1)
SET IDENTITY_INSERT [dbo].[ControleAcesso_FuncionalidadeAcao] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ON 

INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (2, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (3, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (4, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (5, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (6, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 6)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (7, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 7)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (8, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 8)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (9, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (10, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 10)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (11, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 11)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (12, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 12)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (13, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (14, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 14)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (15, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 15)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (16, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 16)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (17, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 17)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (18, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (19, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 19)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (20, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 20)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (21, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 21)
INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdFuncionalidadeAcao]) VALUES (22, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 22)
SET IDENTITY_INSERT [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_Menu] ON 

INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Controle de Acesso', N'fa-user', N'', 1, NULL)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (2, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Usuários', N'', N'', 2, 1)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (3, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Perfil de acesso', N'', N'', 1, 1)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (4, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Fóruns', N'', N'', 2, NULL)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (5, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Comunidade do associado', N'', N'', 1, 4)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (6, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Comissões técnicas', N'', N'', 2, 4)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (7, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Grupo de trabalho', N'', N'', 3, 4)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (8, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Notícias', N'', N'', 3, NULL)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (9, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'News ACREFI', N'', N'', 1, 8)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (10, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Associados', N'', N'', 4, NULL)
INSERT [dbo].[ControleAcesso_Menu] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Exibir], [Descricao], [Icone], [Link], [Ordem], [IdMenuPai]) VALUES (11, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.567' AS DateTime), NULL, NULL, 1, N'Atas', N'', N'', 1, 10)
SET IDENTITY_INSERT [dbo].[ControleAcesso_Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_Perfil] ON 
INSERT [dbo].[ControleAcesso_Perfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Descricao], [Editavel]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, N'Administrador', 1)
SET IDENTITY_INSERT [dbo].[ControleAcesso_Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_Usuario] ON 
INSERT [dbo].[ControleAcesso_Usuario] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [Nome], [Email], [Senha], [Cpf], [Cnpj], [CodigoCadastrarSenha], [AceitePoliticasDeUsoWeb]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.563' AS DateTime), NULL, NULL, N'Roberto Meneghelli', N'r.grigoragi@xpto.com.br', N'Rhdfgr7OscxrawPdlBXN+2lDMfPPIdO0UOb8LlLjFEA=', N'22030089893', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ControleAcesso_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[ControleAcesso_UsuarioPerfil] ON 
INSERT [dbo].[ControleAcesso_UsuarioPerfil] ([Id], [IdUsuarioCadastro], [IdUsuarioAlteracao], [IdUsuarioExclusao], [DataCadastro], [DataAlteracao], [DataExclusao], [IdPerfil], [IdUsuario]) VALUES (1, 1, NULL, NULL, CAST(N'2025-07-08T13:32:03.570' AS DateTime), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ControleAcesso_UsuarioPerfil] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_descricao]    Script Date: 08/07/2025 14:51:48 ******/
ALTER TABLE [dbo].[ControleAcesso_Perfil] ADD  CONSTRAINT [UK_descricao] UNIQUE NONCLUSTERED 
(
	[Descricao] ASC,
	[DataExclusao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Controle__A9D105342251FCD0]    Script Date: 08/07/2025 14:51:48 ******/
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ControleAcesso_Acao] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Acao] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade] ADD  DEFAULT (NULL) FOR [IdMenu]
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade] ADD  DEFAULT ((0)) FOR [FCM_MostrarBackOffice]
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario] ADD  DEFAULT (NULL) FOR [HashSenha]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] ADD  DEFAULT (NULL) FOR [Icone]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] ADD  DEFAULT (NULL) FOR [Link]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] ADD  DEFAULT (NULL) FOR [IdMenuPai]
GO
ALTER TABLE [dbo].[ControleAcesso_Perfil] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Perfil] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Perfil] ADD  DEFAULT ((1)) FOR [Editavel]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [IdUsuarioCadastro]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [IdUsuarioAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [IdUsuarioExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [Senha]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT (NULL) FOR [CodigoCadastrarSenha]
GO
ALTER TABLE [dbo].[ControleAcesso_Usuario] ADD  DEFAULT ((0)) FOR [AceitePoliticasDeUsoWeb]
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil] ADD  DEFAULT (NULL) FOR [DataAlteracao]
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil] ADD  DEFAULT (NULL) FOR [DataExclusao]
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade]  WITH CHECK ADD  CONSTRAINT [FK_Funcionalidade_Menu_IdMenu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[ControleAcesso_Menu] ([Id])
GO
ALTER TABLE [dbo].[ControleAcesso_Funcionalidade] CHECK CONSTRAINT [FK_Funcionalidade_Menu_IdMenu]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao]  WITH CHECK ADD  CONSTRAINT [FK_FuncionalidadeAcao_Acao_IdAcao] FOREIGN KEY([IdAcao])
REFERENCES [dbo].[ControleAcesso_Acao] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao] CHECK CONSTRAINT [FK_FuncionalidadeAcao_Acao_IdAcao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao]  WITH CHECK ADD  CONSTRAINT [FK_FuncionalidadeAcao_Funcionalidade_IdFuncionalidade] FOREIGN KEY([IdFuncionalidade])
REFERENCES [dbo].[ControleAcesso_Funcionalidade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcao] CHECK CONSTRAINT [FK_FuncionalidadeAcao_Funcionalidade_IdFuncionalidade]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_FuncAcaoPerfil_FuncAcao_IdFuncionalidadeAcao] FOREIGN KEY([IdFuncionalidadeAcao])
REFERENCES [dbo].[ControleAcesso_FuncionalidadeAcao] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] CHECK CONSTRAINT [FK_FuncAcaoPerfil_FuncAcao_IdFuncionalidadeAcao]
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil]  WITH CHECK ADD  CONSTRAINT [FK_FuncAcaoPerfil_Perfil_IdPerfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[ControleAcesso_Perfil] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_FuncionalidadeAcaoPerfil] CHECK CONSTRAINT [FK_FuncAcaoPerfil_Perfil_IdPerfil]
GO
ALTER TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSenhaUsuario_Usuario_IdUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[ControleAcesso_Usuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_HistoricoSenhaUsuario] CHECK CONSTRAINT [FK_HistoricoSenhaUsuario_Usuario_IdUsuario]
GO
ALTER TABLE [dbo].[ControleAcesso_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu_IdMenuPai] FOREIGN KEY([IdMenuPai])
REFERENCES [dbo].[ControleAcesso_Menu] ([Id])
GO
ALTER TABLE [dbo].[ControleAcesso_Menu] CHECK CONSTRAINT [FK_Menu_Menu_IdMenuPai]
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPerfil_Perfil_IdPerfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[ControleAcesso_Perfil] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil] CHECK CONSTRAINT [FK_UsuarioPerfil_Perfil_IdPerfil]
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPerfil_Usuario_IdUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[ControleAcesso_Usuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ControleAcesso_UsuarioPerfil] CHECK CONSTRAINT [FK_UsuarioPerfil_Usuario_IdUsuario]
