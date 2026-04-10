SELECT 
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'valid_from']) }} AS customer_key,
    customer_id,
    first_name,
    last_name,
    email,
    region,
    customer_segment,
    created_at,
    valid_from,
    valid_to
FROM {{ ref('silver_customers') }}