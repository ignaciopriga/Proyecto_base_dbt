with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),
promos as (
    select * from {{ ref('slv_sql_server_dbo__promos') }}
),
addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),
enriched as (
    select
          o.*, p.* exclude(promo_id, date_load), a.* exclude(address_id, date_load)
          from orders as o 
          LEFT JOIN promos as p 
          ON o.promo_id=p.promo_id
          LEFT JOIN addresses as a
          ON o.address_id=a.address_id
)

select * from enriched
