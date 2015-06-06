SELECT num, date
FROM 
(
  SELECT DISTINCT COUNT(DISTINCT trip.trip_no) AS num, PIT.date
  FROM pass_in_trip AS PIT INNER JOIN trip ON trip.trip_no = PIT.trip_no
  WHERE trip.town_from = 'Rostov'
  GROUP BY trip.town_from, PIT.date
) t1
WHERE num = (SELECT MAX(num) FROM 
  (
    SELECT DISTINCT COUNT(DISTINCT trip.trip_no) AS num, PIT.date
    FROM pass_in_trip AS PIT INNER JOIN trip ON trip.trip_no = PIT.trip_no
    WHERE trip.town_from = 'Rostov'
    GROUP BY trip.town_from, PIT.date
  ) t2
)