/* Esse Script vai pegar as funcionalidades flagadas pelo usuario na tela de perfil de acesso e verificar se a ação consultar foi solucionada, desde que a funcionalidade possua 1 ou mais ações flagadas que são diferentes da ação consultar */
SELECT 
F.Descricao,
CASE 
  WHEN MAX(CASE WHEN A.Descricao = 'Consultar' THEN 1 ELSE 0 END) = 1 THEN CAST(1 AS bit)
  WHEN COUNT(FA.Id) > 0 THEN CAST(0 AS bit)
  ELSE CAST(1 AS bit)
END AS TemAcaoConsultar
FROM ControleAcesso_Funcionalidade F
LEFT JOIN ControleAcesso_FuncionalidadeAcao FA 
ON FA.IdFuncionalidade = F.Id
AND FA.Id IN @IdsFuncionalidadeAcao
LEFT JOIN ControleAcesso_Acao A 
ON A.Id = FA.IdAcao
WHERE F.FCM_MostrarBackOffice = 1 AND FA.Id IN @IdsFuncionalidadeAcao
GROUP BY F.Descricao;
