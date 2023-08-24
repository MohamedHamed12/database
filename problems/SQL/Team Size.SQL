-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
-- Create the Employee table
CREATE TABLE
    Employee (employee_id INT PRIMARY KEY, team_id INT);

-- Insert data into the Employee table
INSERT INTO
    Employee (employee_id, team_id)
VALUES
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 7),
    (5, 9),
    (6, 9);

SELECT
    e1.employee_id,
    COUNT(*) AS team_size
FROM
    Employee e1
    LEFT JOIN Employee e2 ON e1.team_id = e2.team_id
GROUP BY
    e1.employee_id
