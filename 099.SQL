WITH t1 AS
(
  SELECT ISNULL(in_.point, out_.point) AS point, ISNULL(in_.date, out_.date) AS date, in_.inc, out_.out
  FROM income_o AS in_ FULL JOIN outcome_o AS out_ ON in_.date = out_.date and in_.point = out_.point
)

SELECT t2.point, t2.date AS date_, CASE WHEN t2.out IS NULL THEN t2.date ELSE
(
  SELECT MIN(Day) as Min_Date
  FROM
  (SELECT DATEADD(dd, 1, t2.date) AS Day
  UNION ALL
  SELECT DATEADD(dd, 2, t2.date)
  UNION ALL
  SELECT DATEADD(dd, 3, t2.date)
  UNION ALL
  SELECT DATEADD(dd, 1, 
  (
    SELECT MIN(t1.date) 
    FROM t1 
    WHERE date > t2.date AND DATEADD(dd, 1, t1.date) NOT IN 
    (
      SELECT date 
      FROM outcome_o 
      WHERE point = t2.point
    ) 
    and DATENAME(weekday, DATEADD(dd, 1, date)) <> 'Sunday')
  )
) as tmpl
WHERE (tmpl.day NOT IN 
(
  SELECT date 
  FROM outcome_o 
  WHERE point = t2.point
)) AND (DATENAME(weekday, day) <> 'Sunday'))
END AS sec
FROM t1 AS t2
WHERE t2.inc IS NOT NULL