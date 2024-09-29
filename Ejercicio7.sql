CREATE OR REPLACE TABLE  `keepcoding.billing_account_id` AS
SELECT 
  calls_ivr_id
  ,steps_billing_account_id
FROM `keepcoding.ivr_detail`
WHERE steps_billing_account_id != 'UNKNOWN'
GROUP BY 
  calls_ivr_id
  ,steps_billing_account_id