-- Table tags (like struct tags)

-- DROP TABLE student;
-- CREATE TABLE student (
--     student_id INT,
--     name VARCHAR(20) NOT NULL, -- Non nullable
--     major VARCHAR(20) UNIQUE, -- Unique for each row
--     PRIMARY KEY(student_id)
-- );

-- Adding FIELDS
-- ALTER TABLE student ADD gpa DECIMAL(3,2);

-- INSERT INTO student VALUES(1, "Jack", "Biology", 8.41);
-- INSERT INTO student VALUES(2, "Kate", "Irithyll", 9.22);
-- INSERT INTO student(student_id, name, major) VALUES(3, "Claire", "CSE");
INSERT INTO student VALUES(4, "Jack", "Biologies", 0.62);
INSERT INTO student VALUES(5, "Mike", "CSEY", 8.56);

-- Print everything
SELECT * FROM student;

-- Automatic incrementing
student_id INT AUTO_INCREMENT
INSERT INTO student(name, major) VALUES("Jack", "Biology") -- no ID
