SELECT point, date, SUM(out), SUM(inc)
FROM
(
  SELECT point, date, NULL AS out, SUM(inc) AS inc
  FROM Income
  GROUP BY point, date

  UNION

  SELECT point, date, SUM(out), NULL
  FROM Outcome
  GROUP BY point, date
) t1
GROUP BY point, date
