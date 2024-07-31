CREATE SCHEMA lesson_6;

/*
Создайте хранимую процедуру hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DELIMITER $$ -- //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND  '11:59:59'
			THEN SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND  '17:59:59'
			THEN SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND  '23:59:59'
			THEN SELECT 'Добрый вечер';
		ELSE SELECT 'Доброй ночи';
	END CASE;
END $$ -- //
DELIMITER ; -- обязательно нужно поставить между 'DELIMITER' и ';' пробел !!!


DELIMITER $$
CREATE FUNCTION fib(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE f1 INT DEFAULT 0;
    DECLARE f2 INT DEFAULT 1;
    DECLARE f3 INT DEFAULT 0;
    DECLARE res VARCHAR(100) DEFAULT ' ';
    
    IF num = 1 THEN 
		RETURN res = f1;
	ELSEIF num = 2 THEN
		RETURN res = CONCET(f1, f2);
	ELSE 
		WHILE num > 2 DO
			SET f3 = f1 + f2;
            SET f1 = f2;
            SET f2 = f3;
            SET num = num - 1;
            SET res = CONCET('0 1 ', f3);
		END WHILE;
	END IF;
    RETURN res;
END $$  
DELIMITER ;

DROP FUNCTION fib;

SELECT fib(5);


CREATE TABLE bankaccounts(
accountno varchar(20) PRIMARY KEY NOT NULL,
funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

SELECT * FROM bankaccounts;

-- Изменим баланс на аккаунтах
START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
COMMIT; -- ROLLBACK;
ROLLBACK;



/*
Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
N = 5=>5,4,3,2,1,
*/

DROP PROCEDURE loop_proc;
DELIMITER $$ -- //
CREATE PROCEDURE loop_proc(x INT)
BEGIN
	DECLARE res VARCHAR(200) DEFAULT CAST(x AS char(200));
    REPEAT
		SET x = x - 1;
        SET res = CONCAT(res, ', ', x);
        UNTIL x <= 0
	END REPEAT;
    
    SELECT res;
END $$ -- //
DELIMITER ;

CALL loop_proc(20);
