{% snapshot snapshot_products %}

    {{ config(
        target_database='db_sales',
        target_schema='snapshots',
        strategy='check',
        check_cols=['product_name', 'unit_price', 'category', 'supplier_id', 'sub_category', 'is_active'],
        unique_key='product_id',
        dbt_valid_to_current="to_timestamp('9999-12-31 23:59:59')"
    ) }}

    SELECT product_id,
        product_name,
        unit_price,
        category,
        supplier_id,
        sub_category,
        is_active
     FROM {{ source('bronze', 'products') }}

{% endsnapshot %}