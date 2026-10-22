SELECT
date_trunc(date_date, MONTH) AS datemonth,
SUM(operational_margin - daily_ads_cost) AS ads_margin,
ROUND(SUM(revenue) / NULLIF(SUM(orders_id),0), 2) AS average_basket,
round(SUM(operational_margin),0) AS operational_margin,
SUM(daily_ads_cost) AS ads_cost,
SUM(ads_impressions) AS ads_impression,
SUM(ads_clicks) AS ads_clicks,
SUM(quantity) AS quantity,
round(SUM(revenue),0) AS revenue,
round(SUM(purchase_cost),0) AS purchase_cost,
round(SUM(margin),0) AS margin,
round(SUM(shipping_fee),0) AS shipping_fee,
round(SUM(log_cost),0) AS log_cost,
SUM(ship_cost) AS ship_cost
FROM {{ ref('int_campaign_day') }}
FULL OUTER JOIN {{ ref('finance_days') }}
USING (date_date)
GROUP BY datemonth
ORDER BY datemonth DESC