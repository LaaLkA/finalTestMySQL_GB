-- comment
# comment
/* 
comment
comment
*/

USE lesson_1;
-- 1
SELECT * FROM lesson_1.student;
-- 2
SELECT * FROM student WHERE name='Anton';
-- 3
SELECT name, course FROM student;
-- 4
-- lIKE 
-- Galaxy S10, Galaxy S10+, Galaxy S8, Galaxy A8
-- % - любое кол-во символов или ничего -> tel LIKE 'Galaxy S%' => Galaxy S10, Galaxy S10+, Galaxy S8
-- _ - строго один символ -> tel LIKE 'Galaxy S_' = Galaxy S8
SELECT * FROM student
WHERE name LIKE 'M%';

SELECT * FROM student
WHERE name LIKE 'M_r%';

-- 1. Выбрать всех студентов,у которых стипендия больше 6000
SELECT * FROM student
WHERE stip > 6000;
-- 2. Покажите всех студентов, которые принадлежат к курсу IT.
SELECT * FROM student
WHERE course = 'IT';
-- 3. Отобразите всех студентов, который НЕ принадлежат к курсу IT
SELECT * FROM student
WHERE course != 'IT';

SELECT * FROM student
WHERE NOT course = 'IT';
