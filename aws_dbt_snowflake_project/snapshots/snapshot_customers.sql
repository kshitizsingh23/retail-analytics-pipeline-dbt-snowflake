{% snapshot snapshot_customers %}
    {{
        config(
            target_database='db_sales',
            target_schema='snapshots',
            unique_key='customer_id',
            strategy='check',
            check_cols=['first_name', 'last_name', 'email', 'region', 'customer_segment'],
            dbt_valid_to_current="to_timestamp('9999-12-31 23:59:59')"
        )
    }}
    
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        region,
        customer_segment,
        created_at
    FROM {{ source('bronze', 'customers') }}

{% endsnapshot %}