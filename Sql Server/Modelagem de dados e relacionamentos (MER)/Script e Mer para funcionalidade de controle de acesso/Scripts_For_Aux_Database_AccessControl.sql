SELECT ControleAcesso_FuncionalidadeAcao.Id,
                                  ControleAcesso_Funcionalidade.Descricao AS FuncionalidadeDescricao,
                                  ControleAcesso_Acao.Descricao AS AcaoDescricao,
                                  ControleAcesso_Funcionalidade.InfoToolTip
                           FROM ControleAcesso_FuncionalidadeAcao 
                           INNER JOIN ControleAcesso_Funcionalidade ON ControleAcesso_Funcionalidade.Id = ControleAcesso_FuncionalidadeAcao.IdFuncionalidade
                           INNER JOIN ControleAcesso_Acao ON ControleAcesso_Acao.Id = ControleAcesso_FuncionalidadeAcao.IdAcao
                           WHERE ControleAcesso_FuncionalidadeAcao.DataExclusao IS NULL
                             AND ControleAcesso_Funcionalidade.FCM_MostrarBackOffice = 1
                           ORDER BY ControleAcesso_Funcionalidade.Descricao ASC, ControleAcesso_Acao.Descricao ASC

						   SELECT f.Id, f.Descricao AS DirecionadoPara
                           FROM ControleAcesso_funcionalidade f
                           INNER JOIN ControleAcesso_funcionalidadeacao fa ON fa.IdFuncionalidade = f.Id
                           INNER JOIN ControleAcesso_funcionalidadeacaoperfil pap ON pap.IdFuncionalidadeAcao = fa.Id
                           INNER JOIN ControleAcesso_perfil p ON p.Id = pap.IdPerfil
                           INNER JOIN ControleAcesso_usuarioperfil up ON up.IdPerfil = p.Id
                           INNER JOIN ControleAcesso_usuario u ON u.id = up.IdUsuario
                           WHERE 
                             u.Id = @IdUsuario AND 
                             p.Id = @IdPerfil