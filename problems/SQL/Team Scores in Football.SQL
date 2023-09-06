-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Teams;

CREATE TABLE IF NOT EXISTS
    Teams (
        team_id INT,
        team_name VARCHAR(100),
        PRIMARY KEY (team_id)
    );

INSERT INTO
    Teams (team_id, team_name)
VALUES
    (10, 'Leetcode FC'),
    (20, 'NewYork FC'),
    (30, 'Atlanta FC'),
    (40, 'Chicago FC'),
    (50, 'Toronto FC');

DROP TABLE IF EXISTS Matches;

CREATE TABLE IF NOT EXISTS
    Matches (
        match_id INT,
        host_team INT,
        guest_team INT,
        host_goals INT,
        guest_goals INT,
        PRIMARY KEY (match_id)
    );

INSERT INTO
    Matches (
        match_id,
        host_team,
        guest_team,
        host_goals,
        guest_goals
    )
VALUES
    (1, 10, 20, 3, 0),
    (2, 30, 10, 2, 2),
    (3, 10, 50, 5, 1),
    (4, 20, 30, 1, 0),
    (5, 50, 30, 1, 0);

SELECT
    *
FROM
    Teams;

SELECT
    *
FROM
    Matches;




SELECT
    t.team_id,
    t.team_name,
    SUM(
        CASE
            WHEN t.team_id = m.host_team
            AND m.host_goals > m.guest_goals
            OR t.team_id = m.guest_team
            AND m.host_goals < m.guest_goals THEN 3
            WHEN m.host_goals = m.guest_goals THEN 1
            ELSE 0
        END
    ) AS score
FROM
    Teams t
    LEFT JOIN Matches m ON t.team_id = m.host_team
    OR t.team_id = m.guest_team
GROUP BY
    team_id
ORDER BY
    score DESC;
-- SELECT
--     t.team_id,
--     t.team_name,
--     SUM(
--         CASE
--             WHEN t.team_id = m.host_team
--             AND m.host_goals > m.guest_goals
--             OR t.team_id = m.guest_team
--             AND m.host_goals < m.guest_goals THEN 3
--             WHEN m.host_goals = m.guest_goals THEN 1
--             ELSE 0
--         END
--     ) AS score
-- FROM
--     Teams t
--     LEFT JOIN Matches m ON t.team_id = m.host_team
--     OR t.team_id = m.guest_team
-- GROUP BY
--     team_id
-- ORDER BY
--     score DESC;

-- Teams table:
-- +-----------+--------------+
-- | team_id   | team_name    |
-- +-----------+--------------+
-- | 10        | Leetcode FC  |
-- | 20        | NewYork FC   |
-- | 30        | Atlanta FC   |
-- | 40        | Chicago FC   |
-- | 50        | Toronto FC   |
-- +-----------+--------------+
-- Matches table:
-- +------------+--------------+---------------+-------------+--------------+
-- | match_id   | host_team    | guest_team    | host_goals  | guest_goals  |
-- +------------+--------------+---------------+-------------+--------------+
-- | 1          | 10           | 20            | 3           | 0            |
-- | 2          | 30           | 10            | 2           | 2            |
-- | 3          | 10           | 50            | 5           | 1            |
-- | 4          | 20           | 30            | 1           | 0            |
-- | 5          | 50           | 30            | 1           | 0            |
-- +------------+--------------+---------------+-------------+--------------+
