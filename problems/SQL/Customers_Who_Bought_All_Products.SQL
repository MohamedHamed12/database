-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Customer;

CREATE TABLE
    Customer (customer_id INT, product_key INT);

INSERT INTO
    Customer (customer_id, product_key)
VALUES
    (1, 5),
    (2, 6),
    (3, 5),
    (3, 6),
    (1, 6);

DROP TABLE IF EXISTS Product;

CREATE TABLE
    Product (product_key INT PRIMARY KEY);

INSERT INTO
    Product (product_key)
VALUES
    (5),
    (6);



SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(
        DISTINCT CASE
            WHEN product_key IN (
                SELECT
                    product_key
                FROM
                    Product
            ) THEN product_key
        END
    ) = (
        SELECT
            COUNT(DISTINCT product_key)
        FROM
            Product
    );

-- Customer table:
-- +-------------+-------------+
-- | customer_id | product_key |
-- +-------------+-------------+
-- | 1           | 5           |
-- | 2           | 6           |
-- | 3           | 5           |
-- | 3           | 6           |
-- | 1           | 6           |
-- +-------------+-------------+
-- Product table:
-- +-------------+
-- | product_key |
-- +-------------+
-- | 5           |
-- | 6           |
-- +-------------+
-- Output: 
-- +-------------+
-- | customer_id |
-- +-------------+
-- | 1           |
-- | 3           |