SELECT name
FROM ships INNER JOIN classes ON (ships.class = classes.class)
WHERE ships.launched >= 1922 AND Classes.displacement >= 35000 AND classes.type = 'bb'
