CREATE OR REPLACE TABLE  `keepcoding.customer_phone` AS
SELECT
  calls_ivr_id
  ,calls_phone_number
FROM `keepcoding.ivr_detail`
WHERE calls_phone_number != 'UNKNOWN'
GROUP BY 
  calls_ivr_id
  ,calls_phone_number
