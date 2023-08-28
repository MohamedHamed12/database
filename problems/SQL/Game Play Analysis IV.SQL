-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
DROP TABLE IF EXISTS Activity;

CREATE TABLE IF NOT EXISTS
    Activity (
        player_id INT,
        device_id INT,
        event_date DATE,
        games_played INT
    );

INSERT INTO
    Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

SELECT
    *
FROM
    Activity;

SELECT
    ROUND(
        COUNT(DISTINCT player_id) / (
            SELECT
                COUNT(DISTINCT player_id)
            FROM
                Activity
        ),
        2
    ) AS fraction
FROM
    Activity
WHERE
    (player_id, DATE_SUB (event_date, INTERVAL 1 DAY)) IN (
        SELECT
            player_id,
            MIN(event_date) AS first_login
        FROM
            Activity
        GROUP BY
            player_id
    );
    -- Activity table:
    -- +-----------+-----------+------------+--------------+
    -- | player_id | device_id | event_date | games_played |
    -- +-----------+-----------+------------+--------------+
    -- | 1         | 2         | 2016-03-01 | 5            |
    -- | 1         | 2         | 2016-03-02 | 6            |
    -- | 2         | 3         | 2017-06-25 | 1            |
    -- | 3         | 1         | 2016-03-02 | 0            |
    -- | 3         | 4         | 2018-07-03 | 5            |
    -- +-----------+-----------+------------+--------------+
