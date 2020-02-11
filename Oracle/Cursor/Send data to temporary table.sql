/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Cursor para preencher dados em uma tabela temporaria
/*******************************************************************************************************************************/

declare @Area_Atuacao table (ID_AREA_ATUACAO bigint identity(1,1), sigla varchar(30), descricao varchar(100), sn_excluido varchar(1))
declare @ContraParte table(ID_CONTRAPARTE bigint identity(1,1), ID_QUADRO_ESPECIALIDADE bigint, ID_POSTO_GRADUACAO bigint, NM_RESPONSAVEL varchar(100), SN_EXCLUIDO VARCHAR(1))
declare @Auditoria table(ID_REGISTRO_AUDITORIA bigint identity(1,1),ID_LOGIN bigint,ID_REGISTRO_AUDITADO bigint,DS_MODULO varchar(300),DS_RECURSO_SISTEMICO varchar(300),DS_TIPO varchar(80),DT_REGISTRO datetime,DS_ACAO varchar(300),
RESULTADO_ACAO varchar(300),INFO_ANTERIOR varchar(max), info_alterada varchar(max), origem_acesso varchar(80),tempo_logon bigint, acesso_simultaneo varchar(80), sn_excluido varchar(1))
declare @Historico table(HistoricoId bigint identity(1,1) primary key, Id_Registro bigint, TipoRegistro varchar(300), FkAuditoriaId bigint)
declare @Login table(Id_Login bigint identity(1,1) primary key)
declare @Usuario table(Id_Usuario bigint identity(1,1) primary key, Nome varchar(100), Id_Login bigint)
declare @ListaResultado table(Info_Anterior varchar(max), Info_Alterada varchar(max), Ds_Tipo varchar(80), Dt_Registro datetime,  Responsavel varchar(100), PrimeiroRegistro bit)

--Gerar Dados na Area de Atuação e ContraParte
insert into @Area_Atuacao values('AIS','Serviço de Informação Aeronáutica','N')
insert into @Area_Atuacao values('AIS-SIM','Serviço de Informação Aeronáutica - Simulado','N')
insert into @Area_Atuacao values('ATS','Serviço de Tráfego Aéreo','S')
insert into @Area_Atuacao values('EPTA B','Estação Prestadora de Serviço de Telecomunicações e de Tráfego Aéreo -B','N')

insert into @ContraParte values(1,1,'teste Vigilante - II', 'N')
insert into @ContraParte values(4,5,'CP 16','N') 

insert into @Usuario values('teste Roberto',1)
                                
-- Gerar Registro de Auditoria(INSERT)
insert into @Auditoria values(1,0,'Cadastro basico','Area Atuação','INSERT',getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(1,'Area Atuação',1)
insert into @Auditoria values(1,0,'Cadastro basico','Area Atuação','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(2,'Area Atuação',2)
insert into @Auditoria values(1,0,'Cadastro basico','Area Atuação','INSERT',	getdate() ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'S')
insert into @Historico values(3,'Area Atuação',3)
insert into @Auditoria values(1,0,'Cadastro basico','Area Atuação','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(4,'Area Atuação',4)
insert into @Auditoria values(1,0,'Cadastro basico','ContraParte','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(1,'ContraParte',5)
insert into @Auditoria values(1,0,'Cadastro basico','ContraParte','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(2,'ContraParte',6)
insert into @Auditoria values(1,0,'Cadastro basico','Login','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(1,'Login',6)
insert into @Auditoria values(1,0,'Cadastro basico','Usuario','INSERT',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior','INFO ALTERADA','127.0.0.1',null,null,'N')
insert into @Historico values(1,'Usuario',6)

-- Gerar Registro de Auditoria(UPDATE)
insert into @Auditoria values(1,0,'Cadastro basico','ContraParte','UPDATE',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior1','INFO ALTERADA1','127.0.0.1',null,null,'N')
insert into @Historico values(2,'ContraParte',7)
insert into @Auditoria values(1,0,'Cadastro basico','Area Atuacao','UPDATE',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior3','INFO ALTERADA3','127.0.0.1',null,null,'N')
insert into @Historico values(1,'Area Atuacao',8)
insert into @Auditoria values(1,0,'Cadastro basico','ContraParte','UPDATE',	getdate()  ,'Novo registro','SUCESSO','INFO Anterior2','INFO ALTERADA2','127.0.0.1',null,null,'N')
insert into @Historico values(2,'ContraParte',9)

 --Entrada de dados do usuario
declare @Id_Registro bigint = 2
declare @TipoRegistro varchar(300) = 'ContraParte'

declare @Info_Anterior varchar(max), @Info_Alterada varchar(max), @Ds_Tipo varchar(80), @Dt_Registro datetime, @Id_Login bigint
declare @PrimeiraLeitura bit = 1;
-- Cursor para percorrer os nomes dos objetos 
DECLARE cursor_objects CURSOR FOR
    select INFO_ANTERIOR, INFO_ALTERADA,DS_TIPO,DT_REGISTRO,ID_LOGIN from @Historico join @Auditoria 
    on fkAuditoriaId = ID_REGISTRO_AUDITORIA
    where TipoRegistro = @TipoRegistro and Id_Registro = @Id_Registro
    order by dt_registro asc

-- Abrindo Cursor para leitura
OPEN cursor_objects

-- Lendo a próxima linha
FETCH NEXT FROM cursor_objects INTO @Info_Anterior, @Info_Alterada, @Ds_Tipo, @Dt_Registro,  @Id_Login

-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN
    
    --Validar a informação de cada campo
    if(@PrimeiraLeitura = 1)
        begin
            Insert into @ListaResultado values(@Info_Anterior, @Info_Alterada, @Ds_Tipo, @Dt_Registro, (select Nome from @Usuario where Id_Login = @Id_Login), 1)
            set @PrimeiraLeitura = 0
        end
    else 
        begin
            Insert into @ListaResultado values(@Info_Anterior, @Info_Alterada, @Ds_Tipo, @Dt_Registro, (select Nome from @Usuario where Id_Login = @Id_Login),0)
        end
        
    -- Lendo a próxima linha
    FETCH NEXT FROM cursor_objects INTO @Info_Anterior, @Info_Alterada, @Ds_Tipo, @Dt_Registro, @Id_Login
END

-- Fechando Cursor para leitura
CLOSE cursor_objects

-- Desalocando o cursor
DEALLOCATE cursor_objects

select * from @ListaResultado