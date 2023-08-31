-- database: /mnt/d/Documents/programing/database/test.db
DROP TABLE IF EXISTS Employee;

CREATE TABLE IF NOT EXISTS
    Employee (
        id INTEGER,
        name varchar(255),
        department varchar(255),
        managerId INTEGER
    );

INSERT INTO
    Employee
VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);
SELECT * FROM Employee;   



SELECT e.name AS m
FROM Employee e
WHERE e.id IN (
    SELECT distinct  managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);

-- Employee table:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | None      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
