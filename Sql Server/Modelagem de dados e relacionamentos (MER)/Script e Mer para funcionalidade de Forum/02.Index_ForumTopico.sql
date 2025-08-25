CREATE INDEX IX_ForumTopico_Ativos ON ForumTopico(DataExclusao) WHERE DataExclusao IS NULL;
CREATE INDEX IX_ForumTopico_IdForum_DataCadastro ON ForumTopico(IdForum, DataCadastro DESC);