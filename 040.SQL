SELECT ships.class, name, country
FROM ships INNER JOIN classes ON (ships.class = classes.class)
WHERE numGuns >= 10
