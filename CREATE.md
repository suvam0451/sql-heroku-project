create database giraffe;

# Query OK, 1 row affected (0.01 sec)

```sql
-- Column name, column id
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
);
```

> How it will print out

```
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | NO   | PRI | NULL    |       |
| name       | varchar(20) | YES  |     | NULL    |       |
| major      | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
```

```sql
-- Column name, column id
CREATE TABLE student (
    student_id INT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY(student_id)
);
```

### DESCRIBE

DESCRIBE student;

### Deleting tables
