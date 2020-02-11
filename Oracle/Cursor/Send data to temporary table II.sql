/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Cursor para preencher dados em uma tabela temporaria II
/*******************************************************************************************************************************/

-- 1 Passo(Criar tabela Historico) --Fazer o ID do Historico ser auto incremento
CREATE TABLE Historico(
  ID_HISTORICO NUMBER(19,0) PRIMARY KEY,
  ID_REGISTRO NUMBER(19,0) ,
  TIPO_REGISTRO VARCHAR2(300) ,
  ID_REGISTRO_AUDITORIA NUMBER(19,0),
  CONSTRAINT fk_ID_REGISTRO_AUDITORIA
  FOREIGN KEY(ID_REGISTRO_AUDITORIA)
  REFERENCES REGISTRO_AUDITORIA(ID_REGISTRO_AUDITORIA)
); 

CREATE SEQUENCE SEQ_HISTORICO
   START WITH 1 
   INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tt_TR_Historico BEFORE INSERT ON Historico
FOR EACH ROW
BEGIN
      SELECT SEQ_HISTORICO.NEXTVAL INTO :NEW.HistoricoId
        FROM DUAL;
END;
/

-- 2 Passo(Criar tabelas Temporaria ListaResultado)
CREATE GLOBAL TEMPORARY TABLE tt_v_ListaResultado
(
  Info_Anterior VARCHAR2(4000) ,
  Info_Alterada VARCHAR2(4000) ,
  Ds_Tipo VARCHAR2(80) ,
  Dt_Registro DATE ,
  Responsavel VARCHAR2(100) ,
  PrimeiroRegistro VARCHAR2(1)
);
commit;

--3 Passo(Alterar a tabela de Auditoria para gravar os campos com pipeline, seguindo a ordem dos campos da tabela)

--4 Passo(Criar o script/procedure que vai receber os dados)
SET SERVEROUTPUT ON
   DECLARE 
        v_Id_Registro NUMBER(19,0) := 108;
        v_Tipo_Registro VARCHAR2(300) := 'PERMISSAO_FUNC';
        v_Info_Anterior CLOB;
        v_Info_Alterada CLOB;
        v_Ds_Tipo VARCHAR2(80);
        v_Dt_Registro TIMESTAMP;
        v_Id_Login NUMBER(19,0);
        v_First_Record BOOLEAN := TRUE;  
        v_NomeResponsavel VARCHAR2(500);
        
        CURSOR Busca_Historico IS 
        select INFO_ANTERIOR, INFO_ALTERADA,DS_TIPO,DT_REGISTRO,ID_LOGIN from Historico join Registro_Auditoria 
        on historico.id_registro_auditoria = registro_auditoria.id_registro_auditoria where Tipo_Registro = 'PERMISSAO_FUNC' and Id_Registro = 108 order by dt_registro asc;
        Record_Historico Busca_Historico%Rowtype;
    BEGIN
        Open Busca_Historico;
        Loop
            Fetch Busca_Historico Into Record_Historico;
            Exit When Busca_Historico%NotFound;
            
            if(v_First_Record = true) then
                Dbms_Output.Put_Line(Record_Historico.INFO_ALTERADA);
                
                select Nome into v_NomeResponsavel from Usuario where Id_Login = Record_Historico.ID_LOGIN;
                insert into tt_v_ListaResultado(info_anterior,Info_Alterada,Ds_Tipo,Dt_Registro,Responsavel,PrimeiroRegistro)
                values(Record_Historico.INFO_ANTERIOR,Record_Historico.INFO_ALTERADA,Record_Historico.DS_TIPO,Record_Historico.DT_REGISTRO,v_NomeResponsavel,'S');
                v_First_Record := false;
            else 
                insert into tt_v_ListaResultado(info_anterior,Info_Alterada,Ds_Tipo,Dt_Registro,Responsavel,PrimeiroRegistro)
                values(Record_Historico.INFO_ANTERIOR,Record_Historico.INFO_ALTERADA,Record_Historico.DS_TIPO,Record_Historico.DT_REGISTRO,v_NomeResponsavel,'N');
            end if;
        End Loop;
        Close Busca_Historico;
    END; 
    
    select * from tt_v_ListaResultado;
 
 drop table tt_v_ListaResultado;
 
 select * from historico;
 select * from registro_auditoria where id_registro_auditoria = 51;
