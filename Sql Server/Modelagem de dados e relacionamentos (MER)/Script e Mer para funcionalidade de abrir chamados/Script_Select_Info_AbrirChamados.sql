USE SuporteChamadosDB;
GO

SELECT 
    c.ChamadoID,
    c.Titulo,
    c.Descricao,
    c.DataCriacao,
    c.DataFechamento,
    
    -- Solicitante
    s.Nome AS NomeSolicitante,
    s.Email AS EmailSolicitante,
    s.Instituicao,
    s.AreaAtuacao,
    s.Cargo,
    
    -- Especialista
    e.Nome AS NomeEspecialista,
    
    -- Categoria e Status
    cat.Descricao AS Categoria,
    st.Descricao AS Status,
    
    -- Arquivos (pode trazer mais de 1)
    arq.NomeArquivo,
    arq.CaminhoArquivo,
    arq.DataUpload,
    
    -- Emails de notificação
    en.Email AS EmailNotificacao,
    
    -- Comunicação
    com.ComunicacaoID,
    com.RemetenteTipo,
    ISNULL(s2.Nome, e2.Nome) AS Remetente,
    com.Mensagem,
    com.DataEnvio,

	-- TipoSla
	sla.Descricao,
	sla.TempoResolucaoHoras,
	sla.TempoRespostaHoras

FROM Chamado c
    INNER JOIN Solicitante s ON c.SolicitanteID = s.SolicitanteID
    INNER JOIN Especialista e ON c.EspecialistaID = e.EspecialistaID
    INNER JOIN CategoriaChamado cat ON c.CategoriaID = cat.CategoriaID
    INNER JOIN StatusChamado st ON c.StatusID = st.StatusID
	INNER JOIN TipoSla sla ON c.TipoSlaID = sla.TipoSlaID

    LEFT JOIN Arquivo arq ON c.ChamadoID = arq.ChamadoID
    LEFT JOIN EmailNotificacao en ON c.ChamadoID = en.ChamadoID
    LEFT JOIN Comunicacao com ON c.ChamadoID = com.ChamadoID
    
    -- Para pegar o nome do remetente (se for Solicitante ou Especialista)
    LEFT JOIN Solicitante s2 ON com.RemetenteSolicitanteID = s2.SolicitanteID
    LEFT JOIN Especialista e2 ON com.RemetenteEspecialistaID = e2.EspecialistaID

ORDER BY c.ChamadoID, com.DataEnvio;
