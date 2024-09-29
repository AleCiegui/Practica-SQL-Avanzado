CREATE OR REPLACE TABLE  `keepcoding.info_by_dni_lg` AS
SELECT DISTINCT
  calls_ivr_id
  ,IF(module_result = 'CUSTOMERINFOBYDNI.TX' AND step_result = 'OK', '1', '0')AS info_by_dni_lg
FROM `keepcoding.ivr_detail`
GROUP BY calls_ivr_id
  ,info_by_dni_lg