WITH t1 AS
(
  SELECT b_q_id, SUM(CASE WHEN color = 'R' THEN b_vol ELSE 0 END) AS R, SUM(CASE WHEN color = 'G' THEN b_vol ELSE 0 END) AS G, SUM(CASE WHEN color = 'B' THEN b_vol ELSE 0 END) AS B
  FROM 
  (
    SELECT *, (SELECT v_color FROM utv WHERE v_id = B_V_ID) AS color
    FROM utb
  ) t2
  GROUP BY b_q_id
)

SELECT
255*((SELECT COUNT(*) FROM utq) - (SELECT COUNT(*) FROM t1)) + SUM(255 - R) AS r,
255*((SELECT COUNT(*) FROM utq) - (SELECT COUNT(*) FROM t1)) +  SUM(255 - G) AS g,
255*((SELECT COUNT(*) FROM utq) - (SELECT COUNT(*) FROM t1)) + SUM(255 - B) AS b
FROM t1