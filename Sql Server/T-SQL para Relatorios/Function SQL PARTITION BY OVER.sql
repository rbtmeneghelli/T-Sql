-- A expressão SQL PARTITION BY é uma subcláusula da cláusula OVER, que é usada em quase todas as invocações de funções de janela como AVG(), MAX(), e RANK().
-- A expressão SQL PARTITION BY é recomendada quando queremos obter a media, somatoria entre outras informações de um total a partir de uma condição (tipo, marca ou etc...)

--SELECT
--    car_make,
--    car_model,
--    car_price,
--	-- Nessa linha será obtido o valor medio de todos os carros
--    AVG(car_price) OVER() AS "overall average price",
--	-- Nessa linha será obtido o valor medio com base no tipo de carro 
--    AVG(car_price) OVER (PARTITION BY car_type) AS "car type average price"
--FROM car_list_prices

-- Exemplo de query para obter a media de preço e valor maximo por marca do veiculo (geral)
--SELECT
--  car_make,
--  AVG(car_price) AS average_price,
--  MAX(car_price) AS top_price
--FROM car_list_prices
--GROUP BY car_make;

-- Exemplo de query para obter a media de preço por marca do veiculo (Nesse caso vai apresentar a marca, modelo do carro, preço, e a media de preço com base na marca do carro)
--SELECT
--  car_make,
--  car_model,
--  car_price,
--  AVG(car_price) OVER (PARTITION BY car_make) AS average_make
--FROM car_list_prices;

-- Exemplo de query para obter a media de idade pelo sexo dos alunos (geral)
--select 
--	sexo,
--	avg(idade) as 'Média de idade'
--from #Estudante
--GROUP BY sexo;

-- Exemplo para calcular a idade media de alunos entre sexo masculino e feminino (Nesse caso vai apresentar os dados do aluno e a media de idade do sexo que ele pertence)
--select 
--	nome,
--	sexo,
--	idade,
--	avg(idade) over (partition by sexo) as 'Média de idade'
--from #Estudante

-- Referencia >> https://learnsql.com/blog/partition-by-with-over-sql/
-- Essas funcionalidades são de extrema importancia para relatorios