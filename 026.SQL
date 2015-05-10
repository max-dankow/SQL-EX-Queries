SELECT AVG(price)
FROM
(
  SELECT code, model, price
  FROM pc

  UNION

  SELECT code, model, price
  FROM laptop
) t1 INNER JOIN product ON product.model = t1.model
WHERE maker = 'A'
