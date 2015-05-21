WITH q AS
(
  SELECT COUNT(*) AS num, prod_my.maker
  FROM product AS prod_my
  GROUP BY prod_my.maker
)

SELECT COUNT(*) +
(
  SELECT ISNULL(SUM(r.num), 0) 
  FROM q AS r
  WHERE (r.num = (SELECT q.num FROM q WHERE q.maker = sub2.maker) AND r.maker < sub2.maker) OR r.num > (SELECT q.num FROM q WHERE q.maker = sub2.maker) 
) AS n, sub2.maker, sub2.model
FROM product AS sub1 INNER JOIN product AS sub2 ON (sub1.maker = sub2.maker AND sub1.model <= sub2.model)
GROUP BY sub2.model, sub2.maker
