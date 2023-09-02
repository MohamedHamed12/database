-- database: /mnt/d/Documents/programing/database/test.db
DROP TABLE IF EXISTS Seat;

CREATE TABLE IF NOT EXISTS
    Seat (id INTEGER, student VARCHAR(255));

INSERT INTO
    Seat (id, student)
VALUES
    (1, 'Abbot'),
    (2, 'Doris'),
    (3, 'Emerson'),
    (4, 'Green'),
    (5, 'Jeames');

SELECT
    COALESCE(s2.id, s1.id) id,
    s1.student
FROM
    Seat s1
    LEFT JOIN Seat s2 ON (
        (
            s1.id % 2 = 0
            AND s1.id = s2.id + 1
        )
        OR (
            s1.id % 2 = 1
            AND s1.id + 1 = s2.id
        )
    )
ORDER BY
    id;

SELECT
    *
FROM
    Seat;

-- Seat table:
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Abbot   |
-- | 2  | Doris   |
-- | 3  | Emerson |
-- | 4  | Green   |
-- | 5  | Jeames  |
-- +----+---------+
