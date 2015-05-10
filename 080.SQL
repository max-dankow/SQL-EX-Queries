SELECT DISTINCT maker
FROM product

EXCEPT

SELECT DISTINCT maker
FROM product
WHERE (product.type = 'PC') AND (product.model NOT IN (SELECT model FROM PC))
