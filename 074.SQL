WITH russian_classes AS
(SELECT country, class
FROM classes
WHERE country = 'Russia')

SELECT *
FROM russian_classes

UNION

SELECT country, class
FROM classes
WHERE (SELECT COUNT(*) FROM russian_classes) = 0
