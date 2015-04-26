SELECT t1.class, MIN(launched)
FROM
(
  SELECT classes.class, ships.launched
  FROM ships RIGHT JOIN classes ON ships.class = classes.class
) t1
GROUP BY class
