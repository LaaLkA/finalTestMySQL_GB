CREATE SCHEMA lesson_3;

USE lesson_3;

/*
1. Выведите все записи, отсортированные по полю "age" по возрастанию
2. Выведите все записи, отсортированные по полю " firstname "
3. Выведите записи полей " firstname ", "lastname","age",
отсортированные по полю " firstname " в алфавитном порядке по убыванию
4. Выполните сортировку по полям " firstname " и "age" по убыванию
*/
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(100),
seniority INT,
salary INT,
age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

SELECT * FROM staff;

-- 1
SELECT * FROM staff
ORDER BY age;

-- 2
SELECT * FROM staff
ORDER BY firstname;

-- 3
SELECT 
		firstname
		,lastname 
        ,age 
FROM staff
WHERE 1=1
	AND firstname = 'Юрий' 
	AND age > 24
ORDER BY firstname DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

-- 4
SELECT * 
FROM staff
ORDER BY firstname DESC, age DESC; 

/*
1. Выведите уникальные (неповторяющиеся) значения полей "firstname"
2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые две записи данной выборки
3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки
*/

-- 1
SELECT DISTINCT firstname
FROM staff;

SELECT DISTINCT firstname, age
FROM staff
GROUP BY firstname, age;

-- 2
SELECT *
FROM staff
ORDER BY id
LIMIT 2;

-- 3
SELECT *
FROM staff
ORDER BY id
LIMIT 4, 3;

-- 4
SELECT *
FROM staff
ORDER BY id DESC
LIMIT 2, 3;

/*
1. Рассчитайте общее количество всех страниц daily_typing_pages
2. Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)
3. Посчитайте количество записей в таблице
4. Выведите количество имен, которые являются уникальными
5. Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
*/

DROP TABLE IF EXISTS employee_tbl;
CREATE TABLE employee_tbl (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
id INT NOT NULL,
name VARCHAR(50) NOT NULL,
work_date DATE,
daily_typing_pages INT
);

-- Наполнение данными
INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram', '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

SELECT * FROM employee_tbl;

-- 1
SELECT SUM(daily_typing_pages) AS sum
FROM employee_tbl;

-- 2
SELECT name, SUM(daily_typing_pages) AS sum 
FROM employee_tbl
GROUP BY name;

-- 3
SELECT COUNT(*)
FROM employee_tbl;

-- 4
SELECT COUNT(DISTINCT name)
FROM employee_tbl;

-- 5
SELECT ROUND(AVG(daily_typing_pages), 2) AS avg
FROM employee_tbl;

/*
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы найдите суммарную зарплату
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы
*/

CREATE TABLE employee_salary (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
salary INT
);

-- Наполнение данными
INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

SELECT * FROM employee_salary;

-- Все задачи
SELECT
	age,
    SUM(salary) AS summ,
    MAX(salary) AS max,
    MIN(salary) AS min
FROM employee_salary
GROUP BY age;

/*
Задания:
1. Выведите только те строки, в которых суммарная зарплата больше или равна 1000
2. Выведите только те группы, в которых количество строк меньше или равно двум
3. Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”
4.* Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”
*/ 

-- 1
SELECT
	age,
    SUM(salary) AS summ,
    MAX(salary) AS max,
    MIN(salary) AS min
FROM employee_salary
GROUP BY age
HAVING summ > 1000;

-- 2
SELECT
	age,
    COUNT(*) AS cnt
FRom employee_salary
GROUP BY age
HAVING cnt <= 2;

-- 3
SELECT
	age,
    COUNT(*) AS cnt
FRom employee_salary
GROUP BY age
HAVING cnt BETWEEN 0 AND 2;

-- 4
SELECT
	age,
    COUNT(*) AS cnt
FRom employee_salary
GROUP BY age
HAVING cnt IN (1, 2);


-- ДЗ 
SELECT * FROM staff;

SELECT
  COUNT(*) AS cnt
FROM
  staff
WHERE
  post = 'Рабочий'
  AND age BETWEEN 24 AND 49;
  
SELECT COUNT(DISTINCT post)
FROM staff;

SELECT
	post
FROM staff
GROUP BY post
HAVING  AVG(age) < 30;
 







