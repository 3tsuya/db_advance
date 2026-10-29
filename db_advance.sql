//問題2
SELECT * FROM titles WHERE title = 'Engineer'
UNION
SELECT * FROM titles WHERE title = 'Staff';

//問題3
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY first_name ASC, last_name ASC;

//問題4
SELECT first_name
FROM employees
ORDER BY
CASE
  WHEN birth_date < '1960-01-01' && gender = 'F' THEN 1
  WHEN birth_date >= '1960-01-01' && gender = 'M' THEN 2
  WHEN gender = 'F' THEN 3
  WHEN gender = 'M' THEN 4
END,
first_name ASC;

//問題5
CREATE TABLE departments_bk
LIKE departments;

INSERT INTO departments_bk
SELECT * FROM departments;

//問題6
ALTER TABLE salaries
PARTITION BY RANGE COLUMNS(from_date) (
    PARTITION p1 VALUES LESS THAN ('1990-01-01'),
    PARTITION p2 VALUES LESS THAN ('1995-01-01'),
    PARTITION p3 VALUES LESS THAN ('2000-01-01'),
    PARTITION p4 VALUES LESS THAN ('2005-01-01')
);

//問題7
ALTER TABLE titles
ADD INDEX idx_title (title);

//問題8
ALTER TABLE employees
ADD INDEX idx_gender_firstname_hiredate
(gender, first_name, hire_date);

ALTER TABLE employees
ADD INDEX idx_birth_date (birth_date);

ALTER TABLE titles
ADD INDEX idx_title (title);