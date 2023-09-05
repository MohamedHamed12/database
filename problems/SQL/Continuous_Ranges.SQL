-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Logs;

CREATE TABLE IF NOT EXISTS
    Logs (log_id INT);

INSERT INTO
    Logs (log_id)
VALUES
    (1),
    (2),
    (3),
    (7),
    (8),
    (10);

with
    index_table as (
        SELECT
            ROW_NUMBER() OVER (
                ORDER BY
                    log_id
            ) AS index_column,
            log_id
        FROM
            Logs
    )
SELECT
    log_id,
    log_id + count(index_column) -1
FROM
    index_table
GROUP BY
    log_id - index_column;

-- Logs table:
-- +------------+
-- | log_id     |
-- +------------+
-- | 1          |
-- | 2          |
-- | 3          |
-- | 7          |
-- | 8          |
-- | 10         |
-- +------------+
