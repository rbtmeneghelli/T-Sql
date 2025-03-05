-- A express�o SQL PARTITION BY � uma subcl�usula da cl�usula OVER, que � usada em quase todas as invoca��es de fun��es de janela como AVG(), MAX(), e RANK().
-- A express�o SQL PARTITION BY � recomendada quando queremos obter a media, somatoria entre outras informa��es de um total a partir de uma condi��o (tipo, marca ou etc...)

--SELECT
--    car_make,
--    car_model,
--    car_price,
--	-- Nessa linha ser� obtido o valor medio de todos os carros
--    AVG(car_price) OVER() AS "overall average price",
--	-- Nessa linha ser� obtido o valor medio com base no tipo de carro 
--    AVG(car_price) OVER (PARTITION BY car_type) AS "car type average price"
--FROM car_list_prices

-- Exemplo de query para obter a media de pre�o e valor maximo por marca do veiculo (geral)
--SELECT
--  car_make,
--  AVG(car_price) AS average_price,
--  MAX(car_price) AS top_price
--FROM car_list_prices
--GROUP BY car_make;

-- Exemplo de query para obter a media de pre�o por marca do veiculo (Nesse caso vai apresentar a marca, modelo do carro, pre�o, e a media de pre�o com base na marca do carro)
--SELECT
--  car_make,
--  car_model,
--  car_price,
--  AVG(car_price) OVER (PARTITION BY car_make) AS average_make
--FROM car_list_prices;

-- Exemplo de query para obter a media de idade pelo sexo dos alunos (geral)
--select 
--	sexo,
--	avg(idade) as 'M�dia de idade'
--from #Estudante
--GROUP BY sexo;

-- Exemplo para calcular a idade media de alunos entre sexo masculino e feminino (Nesse caso vai apresentar os dados do aluno e a media de idade do sexo que ele pertence)
--select 
--	nome,
--	sexo,
--	idade,
--	avg(idade) over (partition by sexo) as 'M�dia de idade'
--from #Estudante

-- Referencia >> https://learnsql.com/blog/partition-by-with-over-sql/
-- Essas funcionalidades s�o de extrema importancia para relatorios