SELECT 
(
  SELECT name
  FROM passenger 
  WHERE id_psg = t1.id_psg
) AS name, num
FROM
(
  SELECT DISTINCT _pass.id_psg, COUNT(*) AS num
  FROM Pass_in_trip AS _pass
  GROUP BY _pass.ID_psg, _pass.place
  HAVING COUNT(*) >= ALL 
  (
    SELECT COUNT(*) AS num
    FROM pass_in_trip AS _pass
    GROUP BY _pass.id_psg, _pass.place
  )
) AS t1