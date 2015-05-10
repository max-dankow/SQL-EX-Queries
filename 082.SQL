WITH numbered AS(SELECT ROW_NUMBER() OVER(ORDER BY code) AS number, code, price
FROM PC)

SELECT t1.code, (SELECT AVG(price) FROM numbered WHERE number >= t1.number AND number - 5 <= t1.number) AS avg_price
FROM numbered AS t1
WHERE t1.number + 4 < (SELECT COUNT(*) FROM PC)
