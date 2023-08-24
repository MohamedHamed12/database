-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
CREATE TABLE IF NOT EXISTS
    Departments (id INT PRIMARY KEY, name VARCHAR(100));

INSERT INTO
    Departments (id, name)
VALUES
    (1, 'Electrical Engineering'),
    (7, 'Computer Engineering'),
    (13, 'Bussiness Administration');

CREATE TABLE IF NOT EXISTS
    Students (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES Departments (id)
    );

INSERT INTO
    Students (id, name, department_id)
VALUES
    (23, 'Alice', 1),
    (1, 'Bob', 7),
    (5, 'Jennifer', 13),
    (2, 'John', 14),
    (4, 'Jasmine', 77),
    (3, 'Steve', 74),
    (6, 'Luis', 1),
    (8, 'Jonathan', 7),
    (7, 'Daiana', 33),
    (11, 'Madelynn', 1);

SELECT
    s.id,
    s.name
FROM
    Students s
    LEFT JOIN Departments d ON s.department_id = d.id
WHERE
    d.id IS NULL;

SELECT
    s.id,
    s.name
FROM
    Students s
WHERE
    s.department_id NOT IN (
        SELECT
            d.id
        FROM
            Departments d
    );

-- Departments table:
-- +------+--------------------------+
-- | id   | name                     |
-- +------+--------------------------+
-- | 1    | Electrical Engineering   |
-- | 7    | Computer Engineering     |
-- | 13   | Bussiness Administration |
-- +------+--------------------------+
-- Students table:
-- +------+----------+---------------+
-- | id   | name     | department_id |
-- +------+----------+---------------+
-- | 23   | Alice    | 1             |
-- | 1    | Bob      | 7             |
-- | 5    | Jennifer | 13            |
-- | 2    | John     | 14            |
-- | 4    | Jasmine  | 77            |
-- | 3    | Steve    | 74            |
-- | 6    | Luis     | 1             |
-- | 8    | Jonathan | 7             |
-- | 7    | Daiana   | 33            |
-- | 11   | Madelynn | 1             |
-- +------+----------+---------------+
