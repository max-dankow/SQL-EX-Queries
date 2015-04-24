SELECT class
FROM
(
  SELECT class, COUNT(*) AS ships_count
  FROM
  (
    SELECT DISTINCT classes.class, name
    FROM classes INNER JOIN ships ON (classes.class = ships.class)

    UNION

    SELECT DISTINCT classes.class, ship
    FROM classes INNER JOIN outcomes ON (classes.class = outcomes.ship)
  ) t1
  GROUP BY class
  HAVING COUNT(*) = 1
) t2
