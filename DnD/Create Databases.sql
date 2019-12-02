DROP DATABASE IF EXISTS DnD;
CREATE DATABASE DnD;
USE DnD;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  gender CHAR(1),
  birthday DATE,
  email VARCHAR(120) UNIQUE,
  INDEX users_name_idx(first_name, last_name)
);

DROP TABLE IF EXISTS races;
CREATE TABLE races(
  id_race VARCHAR(150) PRIMARY KEY DEFAULT 'Human',
  min_height TINYINT UNSIGNED,
  max_height TINYINT UNSIGNED,
  min_weight TINYINT UNSIGNED,
  max_weight TINYINT UNSIGNED,
  speed TINYINT UNSIGNED
  -- Добавить рост характеристик и скиллы
);

DROP TABLE IF EXISTS classes;
CREATE TABLE classes(
  id_class VARCHAR(150) PRIMARY KEY DEFAULT 'Fighter',
  hit_dice TINYINT UNSIGNED,
  set_wealth INT UNSIGNED
  -- Добавить рост характеристик, скилы, уникальные ресурсы (чтобы потом добавлять их в characters)
  -- Добавить спасброски
);

DROP TABLE IF EXISTS weapons;
CREATE TABLE weapons(
  id_weapon VARCHAR(150) PRIMARY KEY,
  cost INT UNSIGNED,
  damage TINYINT UNSIGNED,
  weight TINYINT UNSIGNED
);

DROP TABLE IF EXISTS armors;
CREATE TABLE armors(
  id_armor VARCHAR(150) PRIMARY KEY,
  cost INT UNSIGNED,
  armor TINYINT UNSIGNED,
  strenght TINYINT UNSIGNED DEFAULT 0,
  stealth CHAR(1) DEFAULT 'Y',
  weight TINYINT UNSIGNED
);

DROP TABLE IF EXISTS characters;
CREATE TABLE characters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  height TINYINT UNSIGNED,
  weight TINYINT UNSIGNED,
  alignment ENUM('Lawful good', 'Neutral good', 'Chaotic good', 'Lawful neutral', 'Neutral', 'Chaotic neutral', 'Lawful evil', 'Neutral evil', 'Chaotic evil'),
  id_race VARCHAR(150),
  id_class VARCHAR(150),
  id_user BIGINT UNSIGNED NOT NULL,
  id_armors VARCHAR(150),
  id_weapons VARCHAR(150),
  level TINYINT UNSIGNED DEFAULT 1,
  inspiration CHAR(1) DEFAULT '0',
  hp_max TINYINT UNSIGNED DEFAULT 1,
  hp_current TINYINT UNSIGNED DEFAULT 1,
  initiative TINYINT UNSIGNED DEFAULT 1,
  armor_class TINYINT UNSIGNED DEFAULT 1,
  speed TINYINT UNSIGNED DEFAULT 1,
  proficiency TINYINT UNSIGNED DEFAULT 2,
  perception TINYINT UNSIGNED DEFAULT 1,
  FOREIGN KEY (id_race) REFERENCES races(id_race),
  FOREIGN KEY (id_class) REFERENCES classes(id_class),
  FOREIGN KEY (id_weapons) REFERENCES weapons(id_weapon),
  FOREIGN KEY (id_armors) REFERENCES armors(id_armor),
  FOREIGN KEY (id_user) REFERENCES users(id)
  -- Добавить уникальные классовые ресурсы с нулевыми значениями по умолчанию
);

DROP TABLE IF EXISTS points;
CREATE TABLE points(
  id_char SERIAL UNIQUE,
  PRIMARY KEY (id_char),
  strenght TINYINT UNSIGNED,
  dexterity TINYINT UNSIGNED,
  constitution TINYINT UNSIGNED,
  intelligence TINYINT UNSIGNED,
  wisdom TINYINT UNSIGNED,
  charisma TINYINT UNSIGNED,
  FOREIGN KEY (id_char) REFERENCES characters(id)
  -- Добавить спасброски
);

DROP TABLE IF EXISTS wealth;
CREATE TABLE wealth(
  id_char SERIAL UNIQUE ,
  platinum INT UNSIGNED DEFAULT 0,
  gold INT UNSIGNED DEFAULT 0,
  electrum INT UNSIGNED DEFAULT 0,
  silver INT UNSIGNED DEFAULT 0,
  bronze INT UNSIGNED DEFAULT 0,
  FOREIGN KEY (id_char) REFERENCES characters(id),
  PRIMARY KEY (id_char)
);

DROP TABLE IF EXISTS spells;
CREATE TABLE spells(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  level TINYINT UNSIGNED,
  casting_time VARCHAR(150),
  ranges INT UNSIGNED,
  duration TIME,
  description TEXT
  -- Добавить школы, компоненты
);

DROP TABLE IF EXISTS goods;
CREATE TABLE goods(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  type VARCHAR(150),
  description TEXT
);

DROP TABLE IF EXISTS spells_own;
CREATE TABLE spells_own(
  id_char BIGINT UNSIGNED NOT NULL,
  id_spell BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (id_char, id_spell),
  FOREIGN KEY (id_char) REFERENCES characters(id),
  FOREIGN KEY (id_spell) REFERENCES spells(id)
);

DROP TABLE IF EXISTS goods_own;
CREATE TABLE goods_own(
  id_char BIGINT UNSIGNED NOT NULL,
  id_good BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (id_char, id_good),
  FOREIGN KEY (id_char) REFERENCES characters(id),
  FOREIGN KEY (id_good) REFERENCES goods(id)
);