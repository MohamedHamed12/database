-- database: /home/mohamed/doc/Documents/programming/database/test.db
DROP TABLE IF EXISTS INSURANCE;

CREATE TABLE IF NOT EXISTS
    INSURANCE (
        pid INT,
        tiv_2015 INT,
        tiv_2016 INT,
        lat INT,
        lon INT
    );

INSERT INTO
    INSURANCE (pid, tiv_2015, tiv_2016, lat, lon)
VALUES
    (1, 10, 5, 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);

SELECT
    SUM(tiv_2016)
FROM
    INSURANCE 
WHERE
    tiv_2015  IN (
        SELECT
            tiv_2015 
        FROM
            INSURANCE 
        GROUP BY
            tiv_2015
        HAVING
            COUNT(*) > 1
    )
    AND (lat, lon) IN (
        SELECT
            lat,
            lon
        FROM
            INSURANCE 
        GROUP BY
            lat, lon
        HAVING
            COUNT(*) = 1
    );

SELECT * FROM INSURANCE ;
-- Insurance table:
-- +-----+----------+----------+-----+-----+
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- +-----+----------+----------+-----+-----+
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- +-----+----------+----------+-----+-----+
