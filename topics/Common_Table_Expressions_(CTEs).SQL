-- REFERENCES >>>  https://builtin.com/data-science/advanced-sql


-- common table expressions (CTEs) => query a query,  
-- CTEs essentially create a temporary table.

-- Using CTEs is a great way to modularize and break down your code just like you would break an essay down into several paragraphs.


SELECT name
       , salary
FROM People
WHERE name in (SELECT DISTINCT name 
               FROM population 
               WHERE country = "Canada"
                     AND city = "Toronto")
      AND salary >= (SELECT AVG(salary)
                     FROM salaries
                     WHERE gender = "Female")

-- many subqueries or subqueries within subqueries? This is where CTEs come into play.

with toronto_ppl as (
   SELECT DISTINCT name
   FROM population
   WHERE country = "Canada"
         AND city = "Toronto"
)
, avg_female_salary as (
   SELECT AVG(salary) as avgSalary
   FROM salaries
   WHERE gender = "Female"
)
SELECT name
       , salary
FROM People
WHERE name in (SELECT DISTINCT FROM toronto_ppl)
      AND salary >= (SELECT avgSalary FROM avg_female_salary)




