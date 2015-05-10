SELECT maker
FROM
(
  SELECT maker, MAX(type) AS type, COUNT(DISTINCT model) AS model_count
  FROM product
  GROUP BY maker
  HAVING COUNT(DISTINCT type) = 1
) t1
WHERE (type = 'PC' AND model_count > 2) OR (type = 'Printer')
