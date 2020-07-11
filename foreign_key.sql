-- DELETE BEGIN
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS works_with; -- ON DELETE CASCADE set
-- client/works_with pairing
-- ALTER TABLE client DROP CONSTRAINT client_ibfk_1;
-- ALTER TABLE works_with DROP CONSTRAINT client_ibfk_1;
DROP TABLE IF EXISTS `client`;
-- DROP TABLE IF EXISTS `branch_supplier`;
ALTER TABLE branch DROP CONSTRAINT branch_ibfk_1;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS branch;
-- DELETE END
-- CREATE BEGIN
CREATE TABLE IF NOT EXISTS employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);
CREATE TABLE IF NOT EXISTS `branch` (
    `branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE
    SET NULL
);
-- PRIMARY KEY `pk_client_id`(`client_id`)
CREATE TABLE IF NOT EXISTS client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE
    SET NULL
);
-- composite primary key (each being foreign key)
CREATE TABLE IF NOT EXISTS works_with ( -- VERIFIED
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id, client_id),
    -- TODO: NULL vs CASCADE
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- VERIFIED
CREATE TABLE IF NOT EXISTS branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE
    SET NULL
);

-- First branch
INSERT INTO branch VALUES(1, "Corporate", 100, "2006-11-17"); -- 100 linked to david !!!
INSERT INTO employee VALUES(100, "David", "Wallace", "1967-11-17", "M", 250000, NULL, NULL); -- NULL because branch not created yet !!!
INSERT INTO employee VALUES(101, "Jan", "Levinson", "1961-05-11", "M", 260000, NULL, NULL);
-- Next branch
INSERT INTO branch VALUES(1, "Syndicate", 100, "2006-11-17"); -- 100 linked to david !!!
INSERT INTO employee VALUES(102, "Jean Pierre", "Levinson", "1961-05-11", "M", 260000, NULL, NULL);


-- Now that we know the branch, we update the employee (Previously NULL)
UPDATE employee SET branch_id = 1 WHERE emp_id = 100; -- David works for branch 1

INSERT INTO client VALUES(400, "Dum", 2);
INSERT INTO client VALUES(401, "DumDum", 2);
INSERT INTO client VALUES(402, "Froodie", 3);
INSERT INTO client VALUES(403, "John Hanx", 3);

SELECT * FROM employee;
SELECT * FROM branch;

SELECT * FROM employee ORDER BY salary DESC; 
-- Order by sex, then name
SELECT * FROM employee ORDER BY sex, first_name, last_name;
-- Limiting amount
SELECT * FROM employee LIMIT 5;

-- List all possible values 
SELECT DISTINCT branch_id FROM employee;

INSERT INTO works_with(105, 400, 55000);
INSERT INTO works_with(102, 401, 367000);
INSERT INTO works_with(108, 403, 5000);
INSERT INTO works_with(102, 405, 130000);
-- Add foreign key employee.branch_id -- branch.branch_id
-- ALTER TABLE employee
-- ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE
-- SET NULL;
-- Add foreign key employee.super_id -- branch.emp_id
-- ALTER TABLE employee
-- ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE
-- SET NULL;