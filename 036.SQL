SELECT DISTINCT classes.class
FROM classes INNER JOIN ships ON (ships.name = Classes.class)

UNION

SELECT DISTINCT classes.class
FROM classes INNER JOIN outcomes ON (outcomes.ship = Classes.class)
