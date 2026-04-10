SELECT 
    {{ dbt_utils.generate_surrogate_key(['product_id', 'valid_from']) }} AS product_key,
    product_id,
    product_name,
    unit_price,
    category,
    supplier_id,
    sub_category,
    status,
    valid_from,
    valid_to
FROM {{ ref('silver_products') }}