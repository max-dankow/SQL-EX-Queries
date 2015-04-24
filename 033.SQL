SELECT ship
FROM outcomes INNER JOIN battles ON (outcomes.battle = battles.name)
WHERE battles.name = 'North Atlantic' AND result = 'sunk'
