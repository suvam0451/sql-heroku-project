

-- Updating entries by string matching
UPDATE student
SET major = "Bio"
WHERE major = "Biology";

UPDATE student
SET major = "Bio"
WHERE student_id = 4;

UPDATE student
SET major = "Biochemistry"
WHERE major = "Bio" OR major = "Chemistry";

-- Multiple entry update
UPDATE student
SET name = "Tom", major = "undecided"
WHERE student_id = 1;

-- Advanced getting (alphabetical order)
SELECT student.name, student.major
FROM student
ORDER BY name; -- ASC, DESC for descending

SELECT student.name, student.major
FROM student
ORDER BY major, student_id; -- Major first, id second.

-- filtering
SELECT *
FROM student
WHERE major = "Biology";

-- not equal
SELECT name, major
FROM student
WHERE major <> "Chemistry"; -- -ne chemistry

-- based on name
SELECT *
FROM student
WHERE name IN ("Claire", "Kate", "Mike"); -- -ne chemistry