SELECT DISTINCT battle
FROM outcomes INNER JOIN ships ON outcomes.ship = ships.name
  INNER JOIN classes ON classes.class = ships.class
WHERE ships.class = 'Kongo'
