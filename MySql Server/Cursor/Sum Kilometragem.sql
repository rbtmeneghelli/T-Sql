/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Cursor para efetuar a soma de kilometragem
/*******************************************************************************************************************************/

DELIMITER $$
 CREATE PROCEDURE SomaKilometragem(OUT   resultado INT)
 BEGIN
   DECLARE existe_mais_linhas INT DEFAULT 0;
   DECLARE kilometros INT DEFAULT 0;
   DECLARE total_de_kilometros INT DEFAULT 0;

   DECLARE meuCursor CURSOR FOR 
   SELECT  KILOMETRAGEM FROM VEICULOS;

   DECLARE CONTINUE HANDLER FOR NOT FOUND 
   SET existe_mais_linhas=1;

   OPEN meuCursor;
        meuLoop: LOOP
          FETCH meuCursor INTO kilometros; 
           
           IF existe_mais_linhas = 1 THEN
  		LEAVE meuLoop;
  	   END IF; 

	   SET total_de_kilometros = 
           total_de_kilometros + kilometros;
        END LOOP meuLoop;

      SET resultado = total_de_kilometros;
    CLOSE meuCursor;
 END$$
 DELIMITER;
