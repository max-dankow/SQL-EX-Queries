SELECT SUM(sum1)
FROM
( 
  SELECT SUM(income_o.inc) AS sum1
  FROM income_o
  WHERE income_o.date < '2001-04-15'

  UNION

  SELECT SUM(outcome_o.out) * (-1)
  FROM outcome_o
  WHERE outcome_o.date < '2001-04-15'
) t1
