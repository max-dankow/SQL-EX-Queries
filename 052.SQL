SELECT name
FROM ships INNER JOIN classes ON ships.class = classes.class
WHERE ISNULL(country, 'Japan') = 'Japan' AND ISNULL(displacement, 65000) <= 65000 AND ISNULL(numGuns, 9) >= 9 AND ISNULL(type, 'bb') = 'bb' AND ISNULL(bore, 18) < 19
