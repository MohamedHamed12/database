-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
DROP TABLE IF EXISTS Activity;

CREATE TABLE IF NOT EXISTS
    Activity (
        player_id INTEGER,
        device_id INTEGER,
        event_date DATE,
        games_played INTEGER
    );

INSERT INTO
    Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (1, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

SELECT
    *
FROM
    Activity;

SELECT
    player_id,
    event_date,
    sum(games_played) OVER (
        partition by
            player_id
        order by
            event_date
    ) as games_played_so_far
FROM
    Activity
    
    -- Activity table:
    -- +-----------+-----------+------------+--------------+
    -- | player_id | device_id | event_date | games_played |
    -- +-----------+-----------+------------+--------------+
    -- | 1         | 2         | 2016-03-01 | 5            |
    -- | 1         | 2         | 2016-05-02 | 6            |
    -- | 1         | 3         | 2017-06-25 | 1            |
    -- | 3         | 1         | 2016-03-02 | 0            |
    -- | 3         | 4         | 2018-07-03 | 5            |
    -- +-----------+-----------+------------+--------------+
    -- Result table:
    -- +-----------+------------+---------------------+
    -- | player_id | event_date | games_played_so_far |
    -- +-----------+------------+---------------------+
    -- | 1         | 2016-03-01 | 5                   |
    -- | 1         | 2016-05-02 | 11                  |
    -- | 1         | 2017-06-25 | 12                  |
    -- | 3         | 2016-03-02 | 0                   |
    -- | 3         | 2018-07-03 | 5                   |
    -- +-----------+------------+---------------------+
