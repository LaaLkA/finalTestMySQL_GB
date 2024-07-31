/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DROP FUNCTION FormatSeconds;
DELIMITER //
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(100);
    
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds MOD 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds MOD 3600;
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds MOD 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    RETURN result;
END //
DELIMITER ;

SELECT FormatSeconds(123456);

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER //
CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(50) DEFAULT '';

    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ',');
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SET result = TRIM(TRAILING ',' FROM result);

    SELECT result;
END //
DELIMITER ;

CALL PrintEvenNumbers;
