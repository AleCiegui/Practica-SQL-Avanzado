CREATE OR REPLACE TABLE  `keepcoding.ivr_recalls` AS
WITH phone_calls AS (
  SELECT 
    ivr_id,
    phone_number,
    start_date
  FROM `keepcoding.ivr_calls`
)

SELECT 
  a.ivr_id,
  a.phone_number,
  a.start_date,

  -- Flag para llamadas dentro de las 24 horas anteriores (repeated_phone_24H)
  CASE 
    WHEN EXISTS (
      SELECT 1
      FROM phone_calls AS b
      WHERE b.phone_number = a.phone_number
        AND b.start_date BETWEEN DATETIME_SUB(a.start_date, INTERVAL 24 HOUR)AND a.start_date --Ver si hay llamada en las 24h anteriores
        AND b.ivr_id != a.ivr_id -- Asegurar que no es la misma llamada
    ) THEN 1 
      ELSE 0 
      END AS repeated_phone_24H,

  -- Flag para llamadas dentro de las 24 horas posteriores (cause_recall_phone_24H)
  CASE 
    WHEN EXISTS (
      SELECT 1
      FROM phone_calls AS c
      WHERE c.phone_number = a.phone_number
        AND c.start_date BETWEEN a.start_date --Comprobar que la llamada esta entre las 24h siguientes
        AND DATETIME_ADD(a.start_date, INTERVAL 24 HOUR) 
        AND c.ivr_id != a.ivr_id -- Asegurar que no es la misma llamada
    ) THEN 1 
      ELSE 0 
      END AS cause_recall_phone_24H

FROM phone_calls AS a
ORDER BY 
  a.phone_number
  , a.start_date