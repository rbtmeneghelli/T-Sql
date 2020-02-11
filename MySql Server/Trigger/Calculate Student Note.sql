/*******************************************************************************************************************************/
-- Author: Roberto Meneghelli
-- Dev Date: 11/02/2020
-- Description: Função para efetuar calculo de nota
/*******************************************************************************************************************************/

DELIMITER $$
CREATE FUNCTION calc_nota(nota NUMERIC(15,2)) RETURNS NUMERIC(15,2)
  BEGIN
   DECLARE peso INT;
    IF nota > 9.5 THEN
       SET peso = 2;
    ELSE
       SET peso = 1;
    END IF;

    RETURN (nota*peso) / 20;
  END
DELIMITER;
