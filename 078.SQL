SELECT name, CONVERT(char(10), DATEADD(dd, 1 - DATEPART(dd, date), date), 120), CONVERT(char(10), DATEADD(dd, -DATEPART(dd, DATEADD(mm, 1, date)), DATEADD(mm, 1, date)), 120)
FROM battles