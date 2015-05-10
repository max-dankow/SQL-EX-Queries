SELECT name
FROM passenger
WHERE id_psg IN 
(
  SELECT p2.id_psg
  FROM passenger AS p2 INNER JOIN pass_in_trip ON p2.id_psg =      pass_in_trip.id_psg
  WHERE EXISTS
  (
    SELECT place, COUNT(*)
    FROM passenger INNER JOIN pass_in_trip ON passenger.id_psg =   pass_in_trip.id_psg
    WHERE passenger.id_psg = p2.id_psg
    GROUP BY place
    HAVING COUNT(*) >= 2
  )
)
