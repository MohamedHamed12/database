-- database: /home/mohamed/documents/programming/database/test.db
CREATE TABLE IF NOT EXISTS tree_node (
    id INTEGER PRIMARY KEY,
    p_id INTEGER
);




-- +----+------+
-- | id | p_id |
-- +----+------+
-- | 1  | null |
-- | 2  | 1    |
-- | 3  | 1    |
-- | 4  | 2    |
-- | 5  | 2    |
-- +----+------+
