SELECT customer_id,
    first_name,
    last_name,
    email,
    region,
    customer_segment,
    created_at,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to
FROM {{ ref('snapshot_customers') }}