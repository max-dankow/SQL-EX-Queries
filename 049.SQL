SELECT DISTINCT name
FROM ships INNER JOIN classes ON ships.class = classes.class
WHERE bore = 16

UNION

SELECT DISTINCT ship
FROM outcomes INNER JOIN classes ON outcomes.ship = classes.class
WHERE bore = 16
