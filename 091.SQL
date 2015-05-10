SELECT COUNT(*)
FROM 
(
  SELECT maker, COUNT(model) AS number
  FROM Product
  GROUP BY maker
  HAVING COUNT(model) = 1
) t1
