with orders as (
    select * from {{ ref('fct_orders.sql') }}
),
order_items as(
    select * from {{ ref('fct_order_items.sql') }}
)

final as (
    select
          o.*, oi.*
    from orders as o
    LEFT JOIN order_items as oi 
    ON o.order_id = oi.order_id
    where oi.product_id is null
)

select * from final