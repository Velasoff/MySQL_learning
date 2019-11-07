-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO sample.users SELECT *
                         FROM shop.users
                         WHERE id = 1;
DELETE FROM shop.users
WHERE id = 1;
commit;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.
USE shop;
DROP VIEW IF EXISTS names;
CREATE VIEW names (product_name, catalog_name) AS
  (SELECT
     products.name,
     catalogs.name
   FROM products, catalogs
   WHERE products.catalog_id = catalogs.id);

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
-- "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER \\
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
  RETURNS VARCHAR(150)
  BEGIN
    DECLARE hi VARCHAR (150);
    DECLARE real_time INT;
    SET real_time = HOUR (NOW());
    IF real_time BETWEEN 0 AND 6 THEN
      SET hi :=  'Доброй ночи';
    ELSEIF real_time BETWEEN 6 AND 12 THEN
      SET hi :=  'Доброе утро';
    ELSEIF real_time BETWEEN 12 AND 18 THEN
      SET hi :=  'Добрый день';
    ELSE
      SET hi :=  'Доброе вечер';

    END IF;
    RETURN hi;
    END\\
DELIMITER ;
SELECT hello();

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL
-- неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER \\
DROP TRIGGER IF EXISTS products_insert;
CREATE TRIGGER products_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF products.name IS NULL AND products.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'One of name or description must be filled up';
  END IF;
END\\

DROP TRIGGER IF EXISTS products_update;
CREATE TRIGGER products_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
  IF products.name IS NULL AND products.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'One of name or description must be filled up';
  END IF;
END\\

DELIMITER ;

