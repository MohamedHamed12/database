-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db

-- create table 
CREATE TABLE IF NOT EXISTS
    Persons (LastName VARCHAR(255));

-- insert data in table
INSERT INTO Persons (LastName) VALUES 
    ('Doe'),
    ('John'),
    ('Smith'),
    ('Williams'),
    ('Brown'),
    ('Jones'),
    ('Miller'),
    ('Davis');
DROP TABLE IF EXISTS Persons;

-- <<< basic index >>>
CREATE INDEX idx_lastname
ON Persons (LastName);


-- drop index 
DROP INDEX idx_lastname;
DROP INDEX IF EXISTS my_index;



-- <<< unique index >>>
-- A unique index ensures that the indexed column(s) contain only unique values. 
CREATE UNIQUE INDEX IF NOT EXISTS idx_lastname
ON Persons (LastName);



-- <<< composite index  >>>
-- queries  involve multiple columns. In our case, we frequently query employees based on both "department" 
-- and "hire_date." To optimize these queries create a composite index on both columns
CREATE INDEX IF NOT EXISTS idx_department_hire_date ON employees (department, hire_date);
SELECT * FROM employees WHERE department = 'Engineering' AND hire_date > '2020-01-01';