-- «Операторы, фильтрация, сортировка и ограничение»
-- 1 задание

CREATE DATABASE homework;
USE homework;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
    name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
    birthday_at DATE COMMENT "Дата рождения",
    created_at VARCHAR (20),
    updated_at VARCHAR (20)
    );

INSERT INTO users (name, birthday_at) VALUES 
('Геннадий', '1990-10-05'), 
('Наталья', '1984-11-12'),
('Александр', '1985-05-20'),
('Сергей', '1988-02-14'),
('Иван', '1998-01-12'),
('Мария', '1992-08-29');


UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 1;
UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 2;
UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 3;
UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 4;
UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 5;
UPDATE `users` SET `created_at` = '2021-07-08 21:18:12' WHERE `id` = 6;

UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 1;
UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 2;
UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 3;
UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 4;
UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 5;
UPDATE `users` SET `updated_at` = '2021-07-08 21:18:12' WHERE `id` = 6;

SELECT * FROM users;

-- 2 задание

ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'users' AND COLUMN_NAME = 'created_at';
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'users' AND COLUMN_NAME = 'updated_at';

-- 3 задание 

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
    storehouse_id INT UNSIGNED,
    product_id INT UNSIGNED,
    value INT UNSIGNED,
    created_at DATETIME default current_timestamp,
    updated_at DATETIME default current_timestamp ON UPDATE current_timestamp
);

INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
	(1, 3, 8),
    (1, 33, 0),
    (1, 3, 12),
    (1, 44, 0),
    (1, 55, 43),
    (1, 22, 1),
    (1, 9, 53);
    
SELECT * FROM storehouses_products;
SELECT value FROM storehouses_products ORDER BY CASE WHEN value = 0 then 1 else 0 end, value;

-- Практическое задание теме «Агрегация данных»
-- 1 задание

SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AS AVG_Age FROM users;

-- 3 задание
SELECT EXP(sum(log(value))) from table;
