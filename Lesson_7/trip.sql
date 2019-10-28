DROP DATABASE IF EXISTS airplanes;
CREATE DATABASE airplanes;
USE airplanes;

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  _from VARCHAR(255),
  _to VARCHAR(255)
);
INSERT INTO flights (`_from`, `_to`)
VALUES ('Moscow', 'Omsk'),
  ('Novgorod', 'Kazan'),
  ('Irkutsk', 'Moscow'),
  ('Omsk', 'Irkutsk'),
  ('Moscow', 'Kazan');

CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255)
);
INSERT INTO cities (label, name)
VALUES ('Moscow', 'Москва'),
  ('Irkutsk', 'Иркутск'),
  ('Novgorod', 'Новгород'),
  ('Kazan', 'Казань'),
  ('Omsk', 'Омск');

SELECT
  id,
  (SELECT name FROM cities WHERE label = `_from` ) AS FR0M,
  (SELECT name FROM cities WHERE label = `_to` ) AS T0
FROM flights;
