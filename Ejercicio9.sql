CREATE OR REPLACE TABLE  `keepcoding.info_by_phone_lg` AS
SELECT DISTINCT
  calls_ivr_id
  ,IF(module_result = 'CUSTOMERINFOBYPHONE.TX' AND step_result = 'OK', '1', '0')AS info_by_phone_lg
FROM `keepcoding.ivr_detail`
GROUP BY calls_ivr_id
  ,info_by_phone_lg