-- database: /home/mohamed/documents/programming/database/test.db
DROP TABLE IF EXISTS Employees;
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT
);

INSERT INTO Employees (employee_id, employee_name, manager_id)
VALUES
    (1, 'Boss', 1),
    (3, 'Alice', 3),
    (2, 'Bob', 1),
    (4, 'Daniel', 2),
    (7, 'Luis', 4),
    (8, 'Jhon', 3),
    (9, 'Angela', 8),
    (77, 'Robert', 1);
SELECT * FROM Employees;



WITH Recursive CTE AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        0 AS depth
    FROM
        Employees e1
    WHERE
        employee_id = 1
    UNION ALL
    SELECT
        e2.employee_id,
        e2.employee_name,
        e2.manager_id,
        CTE.depth + 1
    FROM
        Employees e2
        JOIN CTE ON e2.manager_id = CTE.employee_id
    WHERE
        e2.employee_id NOT IN (SELECT employee_id FROM CTE)
)
SELECT
    employee_id,
    employee_name,
    manager_id,
    depth
FROM
    CTE;



-- Employees table:
-- +-------------+---------------+------------+
-- | employee_id | employee_name | manager_id |
-- +-------------+---------------+------------+
-- | 1           | Boss          | 1          |
-- | 3           | Alice         | 3          |
-- | 2           | Bob           | 1          |
-- | 4           | Daniel        | 2          |
-- | 7           | Luis          | 4          |
-- | 8           | Jhon          | 3          |
-- | 9           | Angela        | 8          |
-- | 77          | Robert        | 1          |
-- +-------------+---------------+------------+
