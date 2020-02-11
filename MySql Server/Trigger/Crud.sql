/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Trigger para ser executada no Insert, Update ou Delete
/*******************************************************************************************************************************/

DELIMITER $$
 CREATE TRIGGER Tgr_ItensVenda_Insert AFTER  
 INSERT ON ItensVenda
 FOR EACH ROW
 BEGIN
    UPDATE Produtos SET Estoque = Estoque - 
    NEW.Quantidade WHERE Referencia = 
    NEW.Produto;
 END$$
 CREATE TRIGGER Tgr_ItensVenda_Delete 
 AFTER DELETE ON ItensVenda
 FOR EACH ROW
 BEGIN
    UPDATE Produtos SET Estoque = 
    Estoque + OLD.Quantidade
    WHERE Referencia = OLD.Produto;
  END$$
DELIMITER;

DELIMITER $$
 CREATE TRIGGER antesDeUpdate_empregados 
 BEFORE UPDATE ON empregados
 FOR EACH ROW 
 BEGIN
    INSERT INTO empregados_auditoria
    SET acao = 'update',
    id_empregado = OLD.id_empregado,
    sobrenome = OLD.sobrenome,
    modificadoem = NOW(); 
 END$$
DELIMITER;

