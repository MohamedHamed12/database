-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Frindships;

CREATE TABLE IF NOT EXISTS
    Frindships (
        user1_id INT,
        user2_id INT,
        PRIMARY KEY (user1_id, user2_id)
    );

INSERT INTO
    Frindships (user1_id, user2_id)
VALUES
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 3),
    (2, 4),
    (2, 5),
    (6, 1);

DROP TABLE IF EXISTS Likes;

CREATE TABLE IF NOT EXISTS
    Likes (
        user_id INT,
        page_id INT,
        PRIMARY KEY (user_id, page_id)
    );

INSERT INTO
    Likes (user_id, page_id)
VALUES
    (1, 88),
    (2, 23),
    (3, 24),
    (4, 56),
    (5, 11),
    (6, 33),
    (2, 77),
    (3, 77),
    (6, 88);



with
    Frinds as (
        SELECT
            user1_id as user
        FROM
            Frindships
        WHERE
            user2_id = 1
        UNION
        SELECT
            user2_id as user
        FROM
            Frindships
        WHERE
            user1_id = 1
    )
SELECT DISTINCT
    page_id as recommended_page
FROM
    Likes
WHERE
    user_id IN (
        SELECT
            user
        FROM
            Frinds
    )
    AND page_id NOT IN (
        SELECT
            page_id
        FROM
            Likes
        WHERE
            user_id = 1
    )
ORDER BY
    page_id;

SELECT
    *
FROM
    Frindships;

SELECT
    *
FROM
    Likes;

-- Friendship table:
-- +----------+----------+
-- | user1_id | user2_id |
-- +----------+----------+
-- | 1        | 2        |
-- | 1        | 3        |
-- | 1        | 4        |
-- | 2        | 3        |
-- | 2        | 4        |
-- | 2        | 5        |
-- | 6        | 1        |
-- +----------+----------+
-- Likes table:
-- +---------+---------+
-- | user_id | page_id |
-- +---------+---------+
-- | 1       | 88      |
-- | 2       | 23      |
-- | 3       | 24      |
-- | 4       | 56      |
-- | 5       | 11      |
-- | 6       | 33      |
-- | 2       | 77      |
-- | 3       | 77      |
-- | 6       | 88      |
-- +---------+---------+
-- Result table:
-- +------------------+
-- | recommended_page |
-- +------------------+
-- | 23               |
-- | 24               |
-- | 56               |
-- | 33               |
-- | 77               |
-- +------------------+
