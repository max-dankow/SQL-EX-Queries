SELECT maker, model, type
FROM 
(
  SELECT TOP 
  (
    (
      SELECT COUNT(*) 
      FROM Product
    ) - 6) WITH TIES model, maker, type
  FROM 
    (
      SELECT TOP (
      (
        SELECT COUNT(*) 
        FROM product
      ) - 3) WITH TIES model, maker, type
      FROM product
      ORDER BY model DESC
    )t2
  ORDER BY model ASC
) AS t1
