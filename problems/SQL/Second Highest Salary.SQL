-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
DROP TABLE IF EXISTS Employee;

CREATE TABLE IF not exists
    Employee (id INT, salary INT);

INSERT INTO
    Employee (id, salary)
VALUES
    (1, 100),
    (2, 200),
    (3, 300),
    (4, 400);

SELECT
    (
        SELECT DISTINCT
            e.salary
        FROM
            Employee e
        ORDER BY
            e.salary DESC
        LIMIT
            1
        OFFSET
            1
    ) AS SecondHighestSalary;
