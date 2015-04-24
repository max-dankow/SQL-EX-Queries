SELECT country, CAST(AVG(bore * bore * bore / 2) AS NUMERIC(6,2))
FROM
( 
  SELECT class, name
  FROM Ships

  UNION

  SELECT Classes.class, Classes.class
  FROM classes INNER JOIN outcomes ON (Outcomes.ship = Classes.class)
) t1 INNER JOIN Classes ON (Classes.class = t1.class)
GROUP BY country