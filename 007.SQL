SELECT DISTINCT Product.model, PC.price
FROM Product INNER JOIN PC ON Product.model = PC.model
WHERE Product.maker = 'B'

UNION

SELECT DISTINCT Product.model, Laptop.price
FROM Product INNER JOIN Laptop ON Product.model = Laptop.model
WHERE Product.maker = 'B'

UNION

SELECT DISTINCT Product.model, Printer.price
FROM Product INNER JOIN Printer ON Product.model = Printer.model
WHERE Product.maker = 'B'

