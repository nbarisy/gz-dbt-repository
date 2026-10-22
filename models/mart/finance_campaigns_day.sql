select
    f.date_date,
    round(f.operational_margin - i.daily_ads_cost, 1) as ads_margin,
    f.avg_basket as avarage_basket,
    f.operational_margin,
    i.daily_ads_cost,
    i.ads_impressions,
    i.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.log_cost,
    f.ship_cost
    from
{{ref("int_campaign_day")}} as i
left JOIN {{ref("finance_days")}} as f
    on i.date_date = f.date_date 