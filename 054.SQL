SELECT DISTINCT CAST(AVG(CAST(numGuns AS FLOAT)) AS NUMERIC(6,2))
FROM
(  
  SELECT ships.name, classes.type, classes.numGuns
  FROM ships INNER JOIN classes ON  ships.class = classes.class

  UNION

  SELECT classes.class, classes.type, classes.numGuns
  FROM outcomes INNER JOIN classes ON  outcomes.ship = classes.class
) t1
WHERE t1.type = 'bb'
