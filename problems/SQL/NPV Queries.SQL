-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
-- Create NPV table
CREATE TABLE
    NPV (
        id INT,
        year INT,
        npv DECIMAL(10, 2),
        PRIMARY KEY (id, year)
    );

-- Insert data into NPV table
INSERT INTO
    NPV (id, year, npv)
VALUES
    (1, 2018, 100),
    (7, 2020, 30),
    (13, 2019, 40),
    (1, 2019, 113),
    (2, 2008, 121),
    (3, 2009, 12),
    (11, 2020, 99),
    (7, 2019, 0);

-- Create Queries table
CREATE TABLE
    Queries (id INT, year INT, PRIMARY KEY (id, year));

-- Insert data into Queries table
INSERT INTO
    Queries (id, year)
VALUES
    (1, 2019),
    (2, 2008),
    (3, 2009),
    (7, 2018),
    (7, 2019),
    (7, 2020),
    (13, 2019);

SELECT
    q.id,
    q.year,
    ifnull(n.npv, 0) as 'year'
FROM
    Queries q
    LEFT JOIN NPV n on q.id = n.id
    and q.year = n.year


    
    -- WHERE
    -- n.id IS NOT NULL OR n.year IS NOT NULL OR n.npv IS NOT NULL;
    -- Result table:
    -- +------+--------+--------+
    -- | id   | year   | npv    |
    -- +------+--------+--------+
    -- | 1    | 2019   | 113    |
    -- | 2    | 2008   | 121    |
    -- | 3    | 2009   | 12     |
    -- | 7    | 2018   | 0      |
    -- | 7    | 2019   | 0      |
    -- | 7    | 2020   | 30     |
    -- | 13   | 2019   | 40     |
    -- +------+--------+--------+
