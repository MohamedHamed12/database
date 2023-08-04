-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db

-- A simple scalar function that calculates the square of a given number
-- Scalar function to calculate the net salary after deducting taxes
CREATE FUNCTION calculate_net_salary(salary FLOAT) RETURNS FLOAT AS
BEGIN
    DECLARE net_salary FLOAT;
    SET net_salary = salary - (salary * 0.1); -- Deduct 10% as taxes
    RETURN net_salary;
END;

SELECT first_name, last_name, salary, calculate_net_salary(salary) AS net_salary
FROM employees;






-- An aggregate function that calculates the total salary for a department
SELECT customer_id, SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id;



-- Table-valued function to retrieve courses taken by a student
CREATE FUNCTION get_courses_for_student(student_id INTEGER) RETURNS TABLE AS
BEGIN
    RETURN SELECT c.course_name
           FROM courses c
           INNER JOIN enrollments e ON c.course_id = e.course_id
           WHERE e.student_id = student_id;
END;

SELECT student_name, course_name
FROM students s
CROSS APPLY get_courses_for_student(s.student_id) AS course_list;


-- User-defined function to convert Celsius to Fahrenheit
CREATE FUNCTION celsius_to_fahrenheit(celsius FLOAT) RETURNS FLOAT AS
BEGIN
    RETURN (celsius * 9/5) + 32;
END;


SELECT temperature_celsius, celsius_to_fahrenheit(temperature_celsius) AS temperature_fahrenheit
FROM weather_data;
