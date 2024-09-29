CREATE OR REPLACE TABLE  `keepcoding.masiva_lg` AS
SELECT DISTINCT
  calls_ivr_id
  ,IF(module_name = 'AVERIA_MASIVA', '1', '0')AS masiva_lg
FROM `keepcoding.ivr_detail`
GROUP BY calls_ivr_id
  ,masiva_lg