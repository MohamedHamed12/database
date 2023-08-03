-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db
-- Create the Countries table
CREATE TABLE
    Countries (
        country_id INT PRIMARY KEY,
        country_name VARCHAR(100)
    );

-- Insert data into the Countries table
INSERT INTO
    Countries (country_id, country_name)
VALUES
    (2, 'USA'),
    (3, 'Australia'),
    (7, 'Peru'),
    (5, 'China'),
    (8, 'Morocco'),
    (9, 'Spain');

-- Create the Weather table
CREATE TABLE
    Weather (
        country_id INT,
        weather_state INT,
        day DATE,
        PRIMARY KEY (country_id, day),
        FOREIGN KEY (country_id) REFERENCES Countries (country_id)
    );

-- Insert data into the Weather table
INSERT INTO
    Weather (country_id, weather_state, day)
VALUES
    (2, 15, '2019-11-01'),
    (2, 12, '2019-10-28'),
    (2, 12, '2019-10-27'),
    (3, -2, '2019-11-10'),
    (3, 0, '2019-11-11'),
    (3, 3, '2019-11-12'),
    (5, 16, '2019-11-07'),
    (5, 18, '2019-11-09'),
    (5, 21, '2019-11-23'),
    (7, 25, '2019-11-28'),
    (7, 22, '2019-12-01'),
    (7, 20, '2019-12-02'),
    (8, 25, '2019-11-05'),
    (8, 27, '2019-11-15'),
    (8, 31, '2019-11-25'),
    (9, 7, '2019-10-23'),
    (9, 3, '2019-12-23');

SELECT
    c.country_name,
    CASE
        WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
        WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM
    Countries AS c
    INNER JOIN Weather AS w ON c.country_id = w.country_id
WHERE
    w.day LIKE '2019-11-%'
GROUP BY
    c.country_id
