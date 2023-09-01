-- database: /mnt/d/Documents/programing/database/test.db
DROP TABLE IF EXISTS RequestAccepted;

CREATE TABLE IF NOT EXISTS
    RequestAccepted (
        requester_id INTEGER,
        accepter_id INTEGER,
        accept_date DATE
    );

INSERT INTO
    RequestAccepted
VALUES
    (1, 2, '2016/06/03'),
    (1, 3, '2016/06/08'),
    (2, 3, '2016/06/08'),
    (3, 4, '2016/06/09');

SELECT
    *
FROM
    RequestAccepted;

SELECT
    id,
    COUNT(*) as num
FROM
    (
        SELECT
            requester_id as id
        FROM
            RequestAccepted
        UNION ALL
        SELECT
            accepter_id
        FROM
            RequestAccepted
    )
GROUP BY
    id
ORDER BY
    COUNT(*) DESC
LIMIT
    1;

-- RequestAccepted table:
-- +--------------+-------------+-------------+
-- | requester_id | accepter_id | accept_date |
-- +--------------+-------------+-------------+
-- | 1            | 2           | 2016/06/03  |
-- | 1            | 3           | 2016/06/08  |
-- | 2            | 3           | 2016/06/08  |
-- | 3            | 4           | 2016/06/09  |
-- +--------------+-------------+-------------+
