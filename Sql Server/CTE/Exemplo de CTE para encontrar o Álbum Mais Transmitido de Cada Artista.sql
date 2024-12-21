WITH album_streaming AS (
  SELECT artist_id,
       album_id,
       SUM(number_of_streams) AS streams_by_album,
       RANK() OVER (PARTITION BY artist_id ORDER BY SUM(number_of_streams) DESC) AS streaming_rank
  FROM streams
  GROUP BY artist_id, album_id
)
 
SELECT artist_name,
       album_title,
     streams_by_album
FROM album_streaming alst
JOIN albums al
ON alst.album_id = al.id
JOIN artist ar
ON al.artist_id = ar.id
WHERE streaming_rank = 1;