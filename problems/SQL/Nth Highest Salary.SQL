-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
DROP TABLE Employee;

CREATE TABLE IF NOT EXISTS
    Employee (id INT, salary INT);

INSERT INTO
    Employee (id, salary)
VALUES
    (1, 100),
    (2, 200),
    (3, 300);

SELECT
    *
FROM
    employee;

SELECT DISTINCT
    (salary)
from
    Employee
order by
    salary DESC
LIMIT
    1
OFFSET
    1
