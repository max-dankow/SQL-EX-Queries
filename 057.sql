WITH t2 AS
(
  SELECT ships.name, classes.class
  FROM ships INNER JOIN classes ON ships.class = classes.class

  UNION

  SELECT outcomes.ship, f1.class
  FROM outcomes INNER JOIN classes AS f1 ON (outcomes.ship = f1.class)
)

SELECT t1.class, COUNT(*)
FROM 
(
  SELECT class
  FROM t2
  GROUP BY class
  HAVING COUNT(*) > 2
) AS t1 INNER JOIN t2 ON t2.class = t1.class INNER JOIN outcomes ON t2.name = outcomes.ship
WHERE outcomes.result = 'sunk'
GROUP BY t1.class
