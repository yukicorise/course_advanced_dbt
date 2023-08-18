{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

WITH source AS (

  SELECT
    event_id,
    session_id,
    user_id,
    created_at,
    event_name
  FROM {{ ref('stg_bingeflix_events') }}

{% if is_incremental() %}

  {{ incremental_where_clause(column_name = 'created_at', lookback_window = -3, periods = 'day') }}

{% endif %}

)

SELECT * FROM source
