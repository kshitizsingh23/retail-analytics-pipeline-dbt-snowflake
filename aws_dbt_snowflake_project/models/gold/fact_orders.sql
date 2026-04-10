SELECT 
    o.order_id,
    c.customer_key,
    p.product_key,
    o.order_date,
    o.quantity,
    o.unit_price,
    o.discount_amount,
    o.total_amount,
    o.status
FROM {{ ref('silver_orders') }} o
LEFT JOIN {{ ref('dim_customers') }} c 
ON o.customer_id = c.customer_id 
LEFT JOIN {{ ref('dim_products') }} p 
ON o.product_id = p.product_id