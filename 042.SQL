SELECT DISTINCT ship, battle
FROM outcomes INNER JOIN battles ON (outcomes.battle = battles.name)
WHERE result = 'sunk'
