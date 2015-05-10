SELECT COUNT(*)
FROM
(
  SELECT COUNT(trip_no) AS t_count, town_from, town_to
  FROM trip
  GROUP BY town_from, town_to
  HAVING COUNT(trip_no) >= 
  ALL 
  (
    SELECT COUNT(trip_no)
    FROM trip
    GROUP BY town_from, town_to
  )
) t1
