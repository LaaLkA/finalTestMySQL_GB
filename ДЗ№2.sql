-- ДЗ №2
-- Задача 1
CREATE TABLE itresume7925213.manufacturer (
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

INSERT INTO itresume7925213.manufacturer(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');

SELECT * FROM manufacturer;

SELECT * FROM mobile_phones;

-- Задача 2 
SELECT product_name, manufacturer,
	CASE 
		WHEN product_count < 100 THEN 'little'
		WHEN product_count > 100 AND product_count < 300 THEN 'many'
        ELSE 'lots'
	END AS 'status'
FROM mobile_phones;

-- Задача 3
ALTER TABLE mobile_phones
DROP COLUMN manufacturer_id;

ALTER TABLE mobile_phones
ADD COLUMN manufacturer_id BIGINT UNSIGNED;

ALTER TABLE mobile_phones
  ADD FOREIGN KEY(manufacturer_id)
  REFERENCES manufacturer(id)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE mobile_phones
SET manufacturer_id = (
	SELECT id
    FROM manufacturer
    WHERE manufacturer.name = mobile_phones.manufacturer
)
WHERE EXISTS (
SELECT 1
FROM manufacturer
WHERE manufacturer.name = mobile_phones.manufacturer
);

ALTER TABLE mobile_phones
	DROP COLUMN manufacturer;
    
SELECT * FROM mobile_phones;

-- Задача 4
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
    mobile_phones_id INT,
    order_status VARCHAR(100)
);

INSERT INTO orders(mobile_phones_id, order_status)
VALUES 
(1, 'OPEN'),
(2, 'OPEN'),
(3, 'CLOSED'),
(4, 'OPEN'),
(5, 'CANCELLED');

SELECT id,
  CASE
    WHEN order_status= 'OPEN' THEN 'Order is in open state'
    WHEN order_status= 'CLOSED' THEN 'Order is closed'
    ELSE 'Order is cancelled'
  END AS full_order_status
FROM orders;