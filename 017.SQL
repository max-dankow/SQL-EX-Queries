SELECT DISTINCT Product.type, Laptop.model, Laptop.speed
FROM Product INNER JOIN Laptop ON (Product.model = Laptop.model)
WHERE Laptop.speed < ALL (SELECT speed FROM PC)

