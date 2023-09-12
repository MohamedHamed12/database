-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Items;

DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Orders (
        order_id INTEGER,
        customer_id INTEGER,
        order_date DATE,
        item_id INTEGER,
        quantity INTEGER
    );

CREATE TABLE
    Items (
        item_id INTEGER,
        item_name TEXT,
        item_category TEXT
    );

INSERT INTO
    Orders
VALUES
    (1, 1, '2020-06-01', 1, 10),
    (2, 1, '2020-06-08', 2, 10),
    (3, 2, '2020-06-02', 1, 5),
    (4, 3, '2020-06-03', 3, 5),
    (5, 4, '2020-06-04', 4, 1),
    (6, 4, '2020-06-05', 5, 5),
    (7, 5, '2020-06-05', 1, 10),
    (8, 5, '2020-06-14', 4, 5),
    (9, 5, '2020-06-21', 3, 5);

INSERT INTO
    Items
VALUES
    (1, 'LC Alg. Book', 'Book'),
    (2, 'LC DB. Book', 'Book'),
    (3, 'LC SmarthPhone', 'Phone'),
    (4, 'LC Phone 2020', 'Phone'),
    (5, 'LC SmartGlass', 'Glasses'),
    (6, 'LC T-Shirt XL', 'T-Shirt');

SELECT
    Items.item_category as Category,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 1 THEN quantity
        END
    ) as Monday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 2 THEN quantity
        END
    ) as Tuesday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 3 THEN quantity
        END
    ) as Wednesday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 4 THEN quantity
        END
    ) as Thursday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 5 THEN quantity
        END
    ) as Friday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 6 THEN quantity
        END
    ) as Saturday,
    SUM(
        CASE
            WHEN DAYOFWEEK (Orders.order_date) = 7 THEN quantity
        END
    ) as Sunday
FROM
    Orders
    LEFT JOIN Items ON Orders.item_id = Items.item_id
GROUP BY
    Items.item_category;

-- Orders table:
-- ----------+--------------+-------------+--------------+-------------+
-- | order_id   | customer_id  | order_date  | item_id      | quantity    |
-- +------------+--------------+-------------+--------------+-------------+
-- | 1          | 1            | 2020-06-01  | 1            | 10          |
-- | 2          | 1            | 2020-06-08  | 2            | 10          |
-- | 3          | 2            | 2020-06-02  | 1            | 5           |
-- | 4          | 3            | 2020-06-03  | 3            | 5           |
-- | 5          | 4            | 2020-06-04  | 4            | 1           |
-- | 6          | 4            | 2020-06-05  | 5            | 5           |
-- | 7          | 5            | 2020-06-05  | 1            | 10          |
-- | 8          | 5            | 2020-06-14  | 4            | 5           |
-- | 9          | 5            | 2020-06-21  | 3            | 5           |
-- +------------+--------------+-------------+--------------+-------------+
-- Items table:
-- +------------+----------------+---------------+
-- | item_id    | item_name      | item_category |
-- +------------+----------------+---------------+
-- | 1          | LC Alg. Book   | Book          |
-- | 2          | LC DB. Book    | Book          |
-- | 3          | LC SmarthPhone | Phone         |
-- | 4          | LC Phone 2020  | Phone         |
-- | 5          | LC SmartGlass  | Glasses       |
-- | 6          | LC T-Shirt XL  | T-Shirt       |
-- +------------+----------------+---------------+
-- Result table:
-- +------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
-- | Category   | Monday    | Tuesday   | Wednesday | Thursday  | Friday    | Saturday  | Sunday    |
-- +------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
-- | Book       | 20        | 5         | 0         | 0         | 10        | 0         | 0         |
-- | Glasses    | 0         | 0         | 0         | 0         | 5         | 0         | 0         |
-- | Phone      | 0         | 0         | 5         | 1         | 0         | 0         | 10        |
-- | T-Shirt    | 0         | 0         | 0         | 0         | 0         | 0         | 0         |
-- +------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+
