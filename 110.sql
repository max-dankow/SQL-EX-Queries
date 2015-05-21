SELECT 
(
  SELECT name 
  FROM passenger 
  WHERE ID_psg = t1.ID_psg
)
FROM 
(
  SELECT DISTINCT id_psg
  FROM pass_in_trip INNER JOIN trip ON pass_in_trip.trip_no = trip.trip_no
  WHERE DATENAME(weekday, date) = 'Saturday' AND trip.time_out > trip.time_in
) AS t1
