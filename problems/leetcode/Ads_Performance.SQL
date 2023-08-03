-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE IF NOT EXISTS
    Ads (
        ad_id INT,
        user_id INT,
        action varchar(100),
        -- action ENUM('Clicked', 'Viewed', 'Ignored'),
        PRIMARY KEY (ad_id, user_id)
    );

-- +-------+---------+---------+
-- | ad_id | user_id | action  |
-- +-------+---------+---------+
-- | 1     | 1       | Clicked |
-- | 2     | 2       | Clicked |
-- | 3     | 3       | Viewed  |
-- | 5     | 5       | Ignored |
-- | 1     | 7       | Ignored |
-- | 2     | 7       | Viewed  |
-- | 3     | 5       | Clicked |
-- | 1     | 4       | Viewed  |
-- | 2     | 11      | Viewed  |
-- | 1     | 2       | Clicked |
-- +-------+---------+---------+
INSERT INTO
    Ads (ad_id, user_id, ACTION)
VALUES
    (1, 1, 'Clicked'),
    (2, 2, 'Clicked'),
    (3, 3, 'Viewed'),
    (5, 5, 'Ignored'),
    (1, 7, 'Ignored'),
    (2, 7, 'Viewed'),
    (3, 5, 'Clicked'),
    (1, 4, 'Viewed'),
    (2, 11, 'Viewed'),
    (1, 2, 'Clicked');

DROP TABLE IF EXISTS Ads;

SELECT
    ad_id,
    ifnull(
        round(
            sum(action = 'Clicked') * 100 / (sum(action = 'Clicked') + sum(action = 'Viewed')),
            2
        ),
        0
    ) as ctr
FROM
    Ads
GROUP BY
    ad_id
order by
    ctr desc,
    ad_id;
