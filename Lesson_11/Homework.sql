-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products
-- в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа
-- и содержимое поля name.

USE shop;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
  created_at DATETIME,
  name_table VARCHAR(150),
  id_table BIGINT UNSIGNED NOT NULL,
  name VARCHAR(150)
) ENGINE = Archive;

DROP TRIGGER IF EXISTS set_log_users;
CREATE TRIGGER set_log_users
  AFTER INSERT
  ON users
  FOR EACH ROW
  BEGIN
    INSERT INTO logs (created_at, name_table, id_table, name) VALUES (CURRENT_TIMESTAMP, 'users', NEW.id, NEW.name);
  END;

DROP TRIGGER IF EXISTS set_log_catalogs;
CREATE TRIGGER set_log_catalogs
  AFTER INSERT
  ON catalogs
  FOR EACH ROW
  BEGIN
    INSERT INTO logs (created_at, name_table, id_table, name) VALUES (CURRENT_TIMESTAMP, 'catalogs', NEW.id, NEW.name);
  END;

DROP TRIGGER IF EXISTS set_log_products;
CREATE TRIGGER set_log_products
  AFTER INSERT
  ON products
  FOR EACH ROW
  BEGIN
    INSERT INTO logs (created_at, name_table, id_table, name) VALUES (CURRENT_TIMESTAMP, 'products', NEW.id, NEW.name);
  END;

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

SELECT * FROM logs;

