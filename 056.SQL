SELECT t1.class, COUNT(*) AS dead
FROM
classes LEFT JOIN
(
  SELECT ships.name, ships.class, result
  FROM ships INNER JOIN outcomes ON ships.name = outcomes.ship

  UNION

  SELECT classes.class, classes.class, result
  FROM classes INNER JOIN outcomes ON classes.class = outcomes.ship
) t1  ON classes.class = t1.class
WHERE t1.result = 'sunk'
GROUP BY t1.class

UNION

SELECT class, 0 AS dead
FROM classes

EXCEPT

SELECT t1.class, 0 AS dead
FROM
(
  SELECT ships.name, ships.class, result
  FROM ships LEFT JOIN outcomes ON ships.name = outcomes.ship

  UNION

  SELECT classes.class, classes.class, result
  FROM classes INNER JOIN outcomes ON classes.class = outcomes.ship
) t1
WHERE t1.result = 'sunk'
GROUP BY t1.class
