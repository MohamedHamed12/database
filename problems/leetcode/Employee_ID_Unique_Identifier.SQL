-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE IF NOT EXISTS
    Employees (id INT PRIMARY KEY, name VARCHAR(100));

INSERT INTO
    Employees (id, name)
VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');

CREATE TABLE IF NOT EXISTS
    EmployeeUNI (
        id INT,
        unique_id INT,
        PRIMARY KEY (id, unique_id)
    );

INSERT INTO
    EmployeeUNI (id, unique_id)
VALUES
    (3, 1),
    (11, 2),
    (90, 3);

SELECT
    EmployeeUNI.unique_id,
    Employees.name
FROM
    Employees
    LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id
    -- Employees table:
    -- +----+----------+
    -- | id | name     |
    -- +----+----------+
    -- | 1  | Alice    |
    -- | 7  | Bob      |
    -- | 11 | Meir     |
    -- | 90 | Winston  |
    -- | 3  | Jonathan |
    -- +----+----------+
    -- EmployeeUNI table:
    -- +----+-----------+
    -- | id | unique_id |
    -- +----+-----------+
    -- | 3  | 1         |
    -- | 11 | 2         |
    -- | 90 | 3         |
    -- +----+-----------+
    -- Output: 
    -- +-----------+----------+
    -- | unique_id | name     |
    -- +-----------+----------+
    -- | null      | Alice    |
    -- | null      | Bob      |
    -- | 2         | Meir     |
    -- | 3         | Winston  |
    -- | 1         | Jonathan |
    -- +-----------+----------+
