-- REFERENCES >>>  https://builtin.com/data-science/advanced-sql


-- A recursive CTE is a CTE that references itself, just like a recursive function in Python.
--  Recursive CTEs are especially useful when querying hierarchical data like organization charts,
--  file systems, a graph of links between web pages, and so on.

-- A recursive CTE has three parts:

-- The anchor member, which is an initial query that returns the base result of the CTE.
-- The recursive member is a recursive query that references the CTE. This is UNION ALLed with the anchor member
-- A termination condition that stops the recursive member.
-- An example of a recursive CTE that gets the manager ID for each staff ID:

with org_structure as (
   SELECT id
          , manager_id
   FROM staff_members
   WHERE manager_id IS NULL
   UNION ALL
   SELECT sm.id
          , sm.manager_id
   FROM staff_members sm
   INNER JOIN org_structure os
      ON os.id = sm.manager_id




WITH RECURSIVE EmployeeHierarchy (emp_id, emp_name, manager_id, level) AS (
    -- Anchor Member
    SELECT emp_id, emp_name, manager_id, 0 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Member
    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.emp_id
)
SELECT emp_id, emp_name, level
FROM EmployeeHierarchy
ORDER BY emp_id;


-- data
-- emp_id	emp_name	manager_id
-- 1	John	NULL
-- 2	Alice	1
-- 3	Bob	2
-- 4	Carol	2
-- 5	David	1
-- 6	Emma	5
-- 7	Frank	6

-- result
-- emp_id	emp_name	level
-- 1	John	0
-- 2	Alice	1
-- 3	Bob	2
-- 4	Carol	2
-- 5	David	1
-- 6	Emma	2
-- 7	Frank	3