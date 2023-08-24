-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE
    Sessions (session_id INT PRIMARY KEY, duration INT);

INSERT INTO
    Sessions (session_id, duration)
VALUES
    (1, 30),
    (2, 299),
    (3, 340),
    (4, 580),
    (5, 1000);

select
    '[0-5>' as bin,
    count(session_id) as total
from
    Sessions 
where
    round(duration / 60, 2) >= 0
    and round(duration / 60, 2) < 5 
union
select
    '[5-10>' as bin,
    count(session_id) as total
from
    Sessions
where
    round(duration / 60, 2) >= 5
    and round(duration / 60, 2) < 10
union
select
    '[10-15>' as bin,
    count(session_id) as total
from
    Sessions
where
    round(duration / 60, 2) >= 10
    and round(duration / 60, 2) < 15
union
select
    '15 or more' as bin,
    count(session_id) as total
from
    Sessions
where
    round(duration / 60, 2) >= 15;

-- Sessions table:
-- +-------------+---------------+
-- | session_id  | duration      |
-- +-------------+---------------+
-- | 1           | 30            |
-- | 2           | 299           |
-- | 3           | 340           |
-- | 4           | 580           |
-- | 5           | 1000          |
-- +-------------+---------------+
