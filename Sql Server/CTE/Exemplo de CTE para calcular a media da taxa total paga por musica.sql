WITH paid_per_song AS (
  SELECT song_title,
       SUM(number_of_streams * pay_per_stream) AS total_pay
  FROM streams
  GROUP BY id, song_title, pay_per_stream
)
 
SELECT song_title,
       AVG(total_pay) AS average_total_pay
FROM paid_per_song
GROUP BY song_title
ORDER BY average_total_pay DESC;