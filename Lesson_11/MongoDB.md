Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.

> use catalogs
> db.catalogs.insert({name: 'Процессоры'})
> db.catalogs.insert({name: 'Материнские платы'})
> db.catalogs.insert({name: 'Видеокарты'})
> db.catalogs.insert({name: 'Жесткие диски'})
> use products
> db.products.insert({name: 'Intel Core i3-8100'})
> db.products.insert({name: 'Intel Core i5-7400'})
> db.products.insert({name: 'AMD FX-8320E'})
> db.products.insert({name: 'AMD FX-8320'})
> db.products.update({name: 'Intel Core i3-8100'}, {$set:{description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', price: '7890.00'}})
> db.products.update({name: 'Intel Core i5-7400'}, {$set:{description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', price: '12700.00'}})
> db.products.update({name: 'AMD FX-8320E'}, {$set:{description: 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', price: '4780.00'}})
> db.products.update({name: 'AMD FX-8320'}, {$set:{description: 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', price: '7120.00'}})