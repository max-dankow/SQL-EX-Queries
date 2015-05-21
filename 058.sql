SELECT q.maker, p.type, CAST(CAST(
(
  SELECT COUNT(*) 
  FROM product WHERE maker = q.maker AND type = p.type
) * 100 AS NUMERIC(6,2)) 
/ 
(
  SELECT COUNT(*) 
  FROM product 
  WHERE maker = q.maker
) AS NUMERIC(6,2)) AS x
FROM (SELECT DISTINCT maker FROM product) AS q, (SELECT DISTINCT type FROM product) AS p
