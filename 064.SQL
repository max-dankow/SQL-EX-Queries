SELECT point, date, 'inc' AS operation, SUM(day1.inc)
FROM income AS day1
WHERE NOT EXISTS
(
  SELECT *
  FROM outcome
  WHERE outcome.date = day1.date AND outcome.point = day1.point
)
GROUP BY point, date

UNION

SELECT point, date, 'out' AS operation, SUM(day2.out)
FROM outcome AS day2
WHERE NOT EXISTS
(
  SELECT *
  FROM income
  WHERE income.date = day2.date AND income.point = day2.point
)
GROUP BY point, date
