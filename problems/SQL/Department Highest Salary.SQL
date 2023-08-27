-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
DROP TABLE Employee;

CREATE TABLE IF NOT EXISTS
    Employee (
        id int,
        name varchar(255),
        salary int,
        departmentId int
    );

INSERT INTO
    Employee (id, name, salary, departmentId)
VALUES
    (1, 'Joe', 70000, 1),
    (2, 'Jim', 90000, 1),
    (3, 'Henry', 80000, 2),
    (4, 'Sam', 60000, 2),
    (5, 'Max', 90000, 1);

CREATE TABLE IF NOT EXISTS
    Department (id int, name varchar(255));

INSERT INTO
    Department (id, name)
VALUES
    (1, 'IT'),
    (2, 'Sales');

SELECT
    d.name Department,
    e.name Employee,
    e.salary salary
FROM
    Employee e
    LEFT JOIN Department d ON e.departmentId = d.id
WHERE
    e.salary = (
        SELECT
            MAX(salary)
        FROM
            Employee e2
        WHERE
            e2.departmentId = e.departmentId
    );

-- Employee table:
-- +----+-------+--------+--------------+
-- | id | name  | salary | departmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Jim   | 90000  | 1            |
-- | 3  | Henry | 80000  | 2            |
-- | 4  | Sam   | 60000  | 2            |
-- | 5  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+
-- Department table:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | IT    |
-- | 2  | Sales |
-- +----+-------+
-- Output: 
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- | IT         | Max      | 90000  |
-- +------------+----------+--------+
