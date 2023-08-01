SELECT
    IFNULL(
        ROUND(
            (
                select
                    count(*)
                FROM
                    Delivery d
                WHERE
                    d.order_date = d.customer_pref_delivery_date
            ) / count(d.delivery_id),
            2
        ),
        0
    )
FROM
    Delivery