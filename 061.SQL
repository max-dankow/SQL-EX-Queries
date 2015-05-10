SELECT SUM(sum1)
FROM
( 
  SELECT SUM(income_o.inc) AS sum1
  FROM income_o 

  UNION

  SELECT SUM(outcome_o.out) * (-1)
  FROM outcome_o
) t1
