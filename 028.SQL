SELECT CAST(AVG(total * 1.0) AS NUMERIC(6,2))
FROM
(
  SELECT q_id, SUM(amount) AS total
  FROM
  (
    SELECT q_id, (CASE WHEN b_vol IS NULL THEN 0 ELSE b_vol END) AS amount
    FROM
    (
      SELECT * 
      FROM utQ LEFT JOIN utB ON utq.q_id = utB.B_q_id
    ) t1
  ) t2
  GROUP BY q_id
) t3
