-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE
    Activities (sell_date DATE, product VARCHAR(50));

INSERT INTO
    Activities (sell_date, product)
VALUES
    ('2020-05-30', 'Headphone'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Bible'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');

-- SELECT
--     a.sell_date,
--     count(DISTINCT a.product) num_sold,
--     -- GROUP_CONCAT(DISTINCT product ORDER BY product ASC separator ',')
--     GROUP_CONCAT( DISTINCT product order by product ASC separator ',' ) as products
--         FROM Activities GROUP BY sell_date order by sell_date ASC;

-- FROM
--     Activities a
-- GROUP BY
--     a.sell_date
# Write your MySQL query statement below
select sell_date,
count(distinct product) as num_sold,
Group_concat(distinct product ) as products
--     -- GROUP_CONCAT(DISTINCT product ORDER BY product ASC separator ',')

 from activities
group by sell_date;