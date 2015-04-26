SELECT maker, min(type)
FROM Product
GROUP BY maker
HAVING COUNT(*) > 1 AND COUNT(DISTINCT type) = 1
