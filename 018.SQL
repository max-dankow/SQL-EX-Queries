SELECT DISTINCT Product.maker, Printer.price
FROM Product INNER JOIN Printer ON Product.model = Printer.model
WHERE Printer.price in (SELECT MIN(price) FROM Printer WHERE Printer.color = 'y') AND Printer.color = 'y'

