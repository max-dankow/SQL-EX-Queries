SELECT DISTINCT m1.ship
FROM Outcomes AS m1 INNER JOIN Battles AS m2 ON (m1.battle = m2.name)
WHERE result = 'damaged' AND EXISTS 
  (SELECT outcomes.ship
   FROM Outcomes INNER JOIN Battles ON (outcomes.battle = battles.name)
   WHERE (m1.ship = outcomes.ship) AND (m2.date < battles.date)
  )
