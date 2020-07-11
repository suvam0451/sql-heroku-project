-- Deleting tables
-- DROP TABLE student;
-- Altering tables
-- ALTER TABLE student ADD gpa DECIMAL(3,2);
-- ALTER TABLE student DROP COLUMN gpa;
-- Inserting
INSERT INTO student
VALUES(1, "Jack", "Biology", 6.59);
-- Grab all from table
SELECT *
FROM student;
-- If partial data (will get null value)
-- No duplicates allowed for primary key
INSERT INTO student(student_id, name) VALUES(2, "Kate")