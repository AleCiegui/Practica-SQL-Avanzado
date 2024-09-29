CREATE OR REPLACE TABLE  `keepcoding.ivr_summary` AS
SELECT  
    calls.calls_ivr_id AS ivr_id
   , calls.calls_phone_number AS phone_number
   , calls.calls_ivr_result AS ivr_result
   , aggregation.vdn_aggregation
   , calls.calls_start_date AS start_date
   , calls.calls_end_date AS end_date
   , calls.calls_total_duration AS total_duration
   , calls.calls_customer_segment AS customer_segment
   , calls.calls_ivr_language AS ivr_language
   , calls.calls_steps_module AS steps_module
   , calls.calls_module_aggregation AS module_aggregation
   , documents.document_type AS document_type
   , calls.steps_document_identification AS document_identification
   , phone.calls_phone_number AS customer_phone
   , billing_account_id.steps_billing_account_id AS billing_account_id
   , masiva.masiva_lg 
   , info_by_phone.info_by_phone_lg
   , info_by_dni.info_by_dni_lg
   , recalls.repeated_phone_24H
   , recalls.cause_recall_phone_24H

  FROM `keepcoding.ivr_detail` AS calls
  LEFT 
  JOIN `keepcoding.vdn_aggregation` AS aggregation
    ON calls.calls_ivr_id = aggregation.ivr_id
  LEFT 
  JOIN `keepcoding.ivr_documents` AS documents
    ON calls.calls_ivr_id = documents.ivr_id
  LEFT 
  JOIN `keepcoding.customer_phone` AS phone
    ON calls.calls_ivr_id = phone.calls_ivr_id
  LEFT 
  JOIN `keepcoding.billing_account_id` AS billing_account_id
    ON calls.calls_ivr_id = billing_account_id.calls_ivr_id
  LEFT 
  JOIN `keepcoding.masiva_lg` AS masiva
    ON calls.calls_ivr_id = masiva.calls_ivr_id
  LEFT 
  JOIN `keepcoding.info_by_phone_lg` AS info_by_phone
    ON calls.calls_ivr_id = info_by_phone.calls_ivr_id
  LEFT 
  JOIN `keepcoding.info_by_dni_lg` AS info_by_dni
    ON calls.calls_ivr_id = info_by_dni.calls_ivr_id
  LEFT 
  JOIN `keepcoding.ivr_recalls` AS recalls
    ON calls.calls_ivr_id = recalls.ivr_id

