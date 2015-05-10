SELECT DISTINCT maker
FROM product
WHERE EXISTS
(
  SELECT *
  FROM product p1
  WHERE product.type = 'Printer' AND p1.maker = product.maker
)

INTERSECT

SELECT DISTINCT maker
FROM Product INNER JOIN pc ON product.model = pc.model
WHERE pc.speed = 
( 
  SELECT MAX(speed)
  FROM PC
  WHERE ram  = 
  (
    SELECT MIN(ram)
    FROM PC
  )
)
AND
ram =
(
  SELECT MIN(ram)
  FROM PC
)
