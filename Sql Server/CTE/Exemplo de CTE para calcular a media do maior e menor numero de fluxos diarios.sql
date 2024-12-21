WITH daily_streaming AS (
  SELECT date,
       MIN(number_of_streams) AS minimum_streaming,
       MAX(number_of_streams) AS maximum_streaming
  FROM streams
  GROUP BY date
)
 
SELECT AVG(minimum_streaming) AS average_minimum_daily_streaming,
     AVG(maximum_streaming) AS average_maximum__daily_streaming
FROM daily_streaming;