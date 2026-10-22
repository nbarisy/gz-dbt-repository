

with orders_per_day as(
    select
    date_date,
    count(distinct orders_id) as orders_id,
    ROUND(sum(revenue),2) as revenue,
    round(sum(margin),2) as margin,
    round(sum(operational_margin),2) as operational_margin,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(shipping_fee),2) as shipping_fee,
    round(sum(logCost),2) as log_cost,
    sum(ship_cost) as ship_cost,
    cast(sum(quantity) as int) as quantity
    from
    {{ref("int_orders_operational")}}
    group by date_date
)
select
date_date,
orders_id,
revenue,
margin,
operational_margin,
purchase_cost,
shipping_fee,
log_cost,
ship_cost,
quantity,
round(revenue/nullif(orders_id,0),2) as avg_basket
from orders_per_day
order by date_date desc