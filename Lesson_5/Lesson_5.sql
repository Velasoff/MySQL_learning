USE shop;

# В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
# 0, если товар закончился и выше нуля, если на складе имеются запасы.
# Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
# Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT
  id, value
FROM
  storehouses_products
WHERE
  value <> 0
ORDER BY
  value ASC;

# Подсчитайте средний возраст пользователей в таблице users
SELECT SUM((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)/MAX(id) FROM users;

# Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
# Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
  GROUP_CONCAT(name ORDER BY name DESC SEPARATOR ' '),
  DATEPART(dw,year(NOW()),MONTH(birthday_at),DAY(birthday_at)) AS weekday
FROM
  users
GROUP BY
  weekday;