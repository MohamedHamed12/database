select
    p.product_id,
    sum(p.price *) /(count(p.product_id)) average_price
from
    Prices p
    left join UnitsSold u
where
    u.purchase_date = > p.start_date
    and u.purchase_date <= p.end_date
group by
    p.product_id