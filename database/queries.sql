-- Select specific columns
SELECT name, email FROM students;

-- Filter students
SELECT * FROM students
WHERE name = 'Aditi';

-- Sort students alphabetically
SELECT * FROM students
ORDER BY name ASC;

SELECT * FROM students
WHERE id = 3;

-- Update a student's email
UPDATE students
SET email = 'jahnvi.new@example.com'
WHERE id = 1;

-- Return only 2 students
SELECT * FROM students LIMIT 2;

-- Skip the first student
SELECT * FROM students OFFSET 1;

-- Pagination example
SELECT * FROM students LIMIT 2 OFFSET 1;

-- Return unique emails
SELECT DISTINCT email FROM students;