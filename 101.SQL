WITH t1 AS 
(
SELECT *, CASE WHEN color = 'n' THEN 1 ELSE 0 END + 
(
  SELECT COUNT(color) 
  FROM printer 
  WHERE code < p1.code AND color = 'n') AS tmp1
FROM printer AS p1)

SELECT code, model, color, type, price, 
(
  SELECT MAX(model) 
  FROM t1
  WHERE tmp1 = t2.tmp1
) AS max_, 
(
  SELECT COUNT(DISTINCT type) 
  FROM t1 
  WHERE tmp1 = t2.tmp1
) AS types, 
(
  SELECT AVG(price) 
  FROM t1 
  WHERE tmp1 = t2.tmp1) AS price_
FROM t1 AS t2