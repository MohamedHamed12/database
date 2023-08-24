-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE IF NOT EXISTS
    Scores (id INT, score FLOAT);

INSERT INTO
    Scores (id, score)
VALUES
    (1, 3.5),
    (2, 3.65),
    (3, 4.0),
    (4, 3.85),
    (5, 4.0),
    (6, 3.65);

SELECT
    *
FROM
    scores;

SELECT
    s.score,
    dense_rank() OVER (
        ORDER BY
            s.score DESC
    ) "Rank"
FROM
    scores s;

-- Scores table:
-- +----+-------+
-- | id | score |
-- +----+-------+
-- | 1  | 3.50  |
-- | 2  | 3.65  |
-- | 3  | 4.00  |
-- | 4  | 3.85  |
-- | 5  | 4.00  |
-- | 6  | 3.65  |
-- +----+-------+
