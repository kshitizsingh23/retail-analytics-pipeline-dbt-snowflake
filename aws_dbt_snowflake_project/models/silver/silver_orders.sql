{{ config(materialized='incremental',
      unique_key='order_id') }}

SELECT
    order_id,
    order_date,
    customer_id,
    product_id,
    quantity,
    unit_price,
    discount_amount,
    total_amount,
    status

FROM {{ source('bronze', 'orders') }}
{% if is_incremental() %}
WHERE order_date > (SELECT DATEADD(day, -3, MAX(order_date)) FROM {{ this }})
{% endif %}