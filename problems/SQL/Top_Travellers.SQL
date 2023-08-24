-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE IF NOT EXISTS
    Users (id INT PRIMARY KEY, name VARCHAR(100));

CREATE TABLE IF NOT EXISTS
    Rides (
        id INT PRIMARY KEY,
        user_id INT,
        distance INT,
        FOREIGN KEY (user_id) REFERENCES Users (id)
    );

DROP TABLE IF EXISTS Rides;

DROP TABLE IF EXISTS Users;

INSERT INTO
    Users (id, name)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');

INSERT INTO
    Rides (id, user_id, distance)
VALUES
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);

SELECT
    Users.name,
    ifnull(SUM(Rides.distance), 0) AS travelled_distance
from
    Users
    LEFT JOIN Rides ON Users.id = Rides.user_id
GROUP BY
    Users.id
ORDER BY
    travelled_distance DESC,
    Users.name ASC




    
    -- Users table:
    -- +------+-----------+
    -- | id   | name      |
    -- +------+-----------+
    -- | 1    | Alice     |
    -- | 2    | Bob       |
    -- | 3    | Alex      |
    -- | 4    | Donald    |
    -- | 7    | Lee       |
    -- | 13   | Jonathan  |
    -- | 19   | Elvis     |
    -- +------+-----------+
    -- Rides table:
    -- +------+----------+----------+
    -- | id   | user_id  | distance |
    -- +------+----------+----------+
    -- | 1    | 1        | 120      |
    -- | 2    | 2        | 317      |
    -- | 3    | 3        | 222      |
    -- | 4    | 7        | 100      |
    -- | 5    | 13       | 312      |
    -- | 6    | 19       | 50       |
    -- | 7    | 7        | 120      |
    -- | 8    | 19       | 400      |
    -- | 9    | 7        | 230      |
    -- +------+----------+----------+
    -- Output: 
    -- +----------+--------------------+
    -- | name     | travelled_distance |
    -- +----------+--------------------+
    -- | Elvis    | 450                |
    -- | Lee      | 450                |
    -- | Bob      | 317                |
    -- | Jonathan | 312                |
    -- | Alex     | 222                |
    -- | Alice    | 120                |
    -- | Donald   | 0                  |
    -- +----------+--------------------+
