SELECT product_id,
    product_name,
    unit_price,
    category,
    supplier_id,
    sub_category,
    CASE 
        WHEN is_active=TRUE THEN 1
        ELSE 0
    END AS status,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to
FROM {{ ref('snapshot_products') }}