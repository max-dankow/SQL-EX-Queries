SELECT maker, COUNT(model)
FROM product
GROUP BY maker
HAVING COUNT(model) >= ALL 
(
  SELECT * 
  FROM 
  (
    SELECT COUNT(model) AS number
    FROM Product
    GROUP BY Maker
  ) t1
)

UNION

SELECT maker, COUNT(model)
FROM product
GROUP BY maker
HAVING COUNT(model) <= ALL 
(
  SELECT * 
  FROM 
  (
    SELECT COUNT(model) AS number
    FROM Product
    GROUP BY Maker
  ) t2
)