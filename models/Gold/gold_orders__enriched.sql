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
          * 
          from orders as o 
          JOIN promos as p 
          ON o.promo_id=p.promo_id
          JOIN addresses as a
          ON o.address_id=p.address_id
)

select * from enriched
