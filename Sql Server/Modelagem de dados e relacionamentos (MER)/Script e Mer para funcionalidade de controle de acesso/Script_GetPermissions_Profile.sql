SELECT 
    p.IdUsuarioCadastro, 
    DataCadastro = CONVERT(VARCHAR, p.DataCadastro, 103), 
    HoraCadastro = FORMAT(p.DataCadastro, 'HH:mm:ss', 'pt-BR'),
    NomePerfil = ISNULL(p.Descricao,''),
    Status = IIF(ISNULL(p.DataExclusao,'') = '', 1, 0),
    PermissoesFuncionalidade = STRING_AGG(
        CAST(f.DescFuncionalidade + '(' + f.DescAcao + ')' AS NVARCHAR(MAX)), 
        ';'
    )
FROM ControleAcesso_Perfil p
JOIN (
    SELECT DISTINCT 
        pf.IdPerfil, 
        f.Descricao AS DescFuncionalidade,
        STRING_AGG(a.Descricao,';') AS DescAcao
    FROM ControleAcesso_Funcionalidade f
    JOIN ControleAcesso_FuncionalidadeAcao fa
        ON f.Id = fa.IdFuncionalidade
    JOIN ControleAcesso_FuncionalidadeAcaoPerfil pf
        ON fa.Id = pf.IdFuncionalidadeAcao
    JOIN ControleAcesso_Acao a
        ON fa.IdAcao = a.Id
	WHERE pf.IdPerfil = 1005 and f.FCM_MostrarBackOffice = 1
	GROUP BY pf.IdPerfil,f.Descricao
) f
    ON p.Id = f.IdPerfil
WHERE p.Id = 1005
GROUP BY 
    p.IdUsuarioCadastro, 
    p.DataCadastro, 
    p.Descricao, 
    p.DataExclusao;


