SELECT maker, AVG(hd)
FROM Product INNER JOIN PC ON (Product.model = PC.model)
WHERE maker IN
(  
  SELECT maker
  FROM Product
  WHERE type = 'Printer'
)
GROUP BY maker
