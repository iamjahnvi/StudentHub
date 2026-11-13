CREATE TABLE students (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- id : This is the column name. We use id to give every student a unique identification number.
-- INTEGER : DataType
-- GENERATED ALWAYS AS IDENTITY : It tells PostgreSQL to automatically generate a number whenever a new student is inserted.
-- PRIMARY KEY : A primary key uniquely identifies every row in a table. It has two important rules: - It must be unique. - It cannot be NULL (empty).
-- VARCHAR(100) : VARCHAR stands for Variable Character It is a data type used to store text. The 100 means the maximum allowed length is 100 characters.
-- This stands for Timestamp With Time Zone. It stores a date and time as an absolute point in time, internally normalized to UTC.
-- DEFAULT CURRENT_TIMESTAMP : 
-- - DEFAULT → Specifies a value PostgreSQL should automatically use if we don't provide one.
-- - CURRENT_TIMESTAMP → Returns the current date and time.

CREATE TABLE courses(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) CHECK(price >= 0)
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
)

-- NUMERIC(10,2) = store numbers upto 2 decimal places
-- 10 - Maximum total number of digits.


CREATE TABLE enrollments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES courses(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id, course_id)
);

-- REFERENCES students(id) — connects a student to an existing student record.
-- REFERENCES courses(id) — connects an enrollment to an existing course
-- ON DELETE CASCADE — automatically deletes related enrollments if their student or course is deleted.
-- UNIQUE (student_id, course_id) — prevents the same student from enrolling in the same course twice.