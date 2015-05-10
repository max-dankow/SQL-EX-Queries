SELECT income_o.point, income_o.date, Income_o.inc, Outcome_o.out
FROM income_o FULL JOIN outcome_o ON ((income_o.date = outcome_o.date) AND (income_o.point = outcome_o.point))
WHERE income_o.date IS NOT NULL

UNION 

SELECT outcome_o.point, outcome_o.date, Income_o.inc, Outcome_o.out
FROM income_o FULL JOIN outcome_o ON ((income_o.date = outcome_o.date) AND (income_o.point = outcome_o.point))
WHERE outcome_o.date IS NOT NULL
