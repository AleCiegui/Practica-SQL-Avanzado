CREATE OR REPLACE TABLE  `keepcoding.vdn_aggregation` AS
SELECT  
  ivr_id  
  ,CASE 
    WHEN vdn_label LIKE 'ATC%' THEN 'FRONT'
    WHEN vdn_label LIKE 'TECH%' THEN 'TECH'
    WHEN vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
    ELSE 'RESTO'
  END  AS vdn_aggregation
  FROM `keepcoding.ivr_calls` AS aggregation
   