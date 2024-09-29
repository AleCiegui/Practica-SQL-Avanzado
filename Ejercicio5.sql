CREATE OR REPLACE TABLE  `keepcoding.ivr_documents` AS
SELECT
  ivr_id
  ,document_type
  ,document_identification
FROM `keepcoding.ivr_steps`
WHERE document_type != 'UNKNOWN'
  AND document_identification != 'UNKNOWN'
GROUP BY 
  ivr_id
  ,document_type
  ,document_identification