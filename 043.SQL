SELECT b1.name
FROM battles AS b1
WHERE NOT EXISTS
(
  SELECT DISTINCT launched
  FROM ships
  WHERE YEAR(b1.date) = launched
)
