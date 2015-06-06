WITH t1 AS 
(
  SELECT B_DATETIME, b_q_id, b_v_id, b_vol, ROW_NUMBER() OVER(ORDER BY B_DATETIME, b_q_id, b_v_id) AS num
  FROM utB
)

SELECT B_DATETIME, b_q_id, b_v_id, b_vol, 
CAST(
(
  SELECT EXP(SUM(CASE WHEN num % 2 <> 0 THEN LOG(CAST(b_vol AS FLOAT)) ELSE 0 END)) / EXP(SUM(CASE WHEN num % 2 = 0 THEN LOG(CAST(b_vol AS FLOAT)) ELSE 0 END))
  FROM t1
  WHERE num <= t2.num
) AS NUMERIC(12, 8)) AS field
FROM t1 AS t2