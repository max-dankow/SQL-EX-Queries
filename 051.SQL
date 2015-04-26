SELECT t1.name
FROM 
(
  SELECT ships.name, classes.displacement, classes.numGuns
  FROM ships INNER JOIN classes ON  ships.class = classes.class

  UNION

  SELECT classes.class, classes.displacement, classes.numGuns
  FROM outcomes INNER JOIN classes ON  outcomes.ship = classes.class
)t1
WHERE numGuns >= ALL
(
  SELECT numGuns
  FROM
  (
    SELECT ships.name, classes.displacement, classes.numGuns
    FROM ships INNER JOIN classes ON  ships.class = classes.class

    UNION

    SELECT classes.class, classes.displacement, classes.numGuns
    FROM outcomes INNER JOIN classes ON  outcomes.ship = classes.class
  )t2
  WHERE t1.displacement = t2.displacement
)
