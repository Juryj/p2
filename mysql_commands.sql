CREATE TABLE products (`id` INT(10) NOT NULL AUTO_INCREMENT, `name` CHAR(10), `type` INT(10), PRIMARY KEY(`id`));
CREATE TABLE attributes (`id` INT(10) NOT NULL AUTO_INCREMENT, `name` CHAR(10), PRIMARY KEY(`id`));
CREATE TABLE attributes_values (`id` INT(10) NOT NULL AUTO_INCREMENT, `value` CHAR(10), PRIMARY KEY(`id`));
CREATE TABLE relations (`id_products` INT(10), `id_attributes` INT(10), `id_attributes_values` INT(10),
                    FOREIGN KEY (id_products) REFERENCES products(id),
                    FOREIGN KEY (id_attributes) REFERENCES attributes(id),
                    FOREIGN KEY (id_attributes_values) REFERENCES attributes_values(id)); 
					
  --Изменение структуры существующей таблицы а именно дабавляет индекс в поле 'name' в таблицу products имя индекса product_name.
ALTER TABLE products
  ADD UNIQUE INDEX product_name (name(10));
  
 --Изменение структуры существующей таблицы а именно дабавляет индекс в поле 'name' в таблицу attributes_values имя индекса values_name.
ALTER TABLE attributes_values
  add unique INDEX values_name (value(10));
  
 --Изменение структуры существующей таблицы а именно дабавляет индекс в поле 'name' в таблицу attributes имя индекса attributes_name.
ALTER TABLE attributes
  ADD UNIQUE INDEX attributes_name (name(10));
 
 --Изменение структуры существующей таблицы а именно дабавляет индексы таблицу relation_index.
ALTER TABLE relations
  ADD UNIQUE INDEX relation_index (id_products, id_attributes, id_attributes_values);

 
  --Вставка записей
INSERT INTO products (name, type) VALUES ('Шапка', '5');
INSERT INTO products (name, type) VALUES ('Шарф', '6');
INSERT INTO attributes (name) VALUES ('Цвет');
INSERT INTO attributes (name) VALUES ('Размер');
INSERT INTO attributes_values (value) VALUES ('Зеленый');
INSERT INTO attributes_values (value) VALUES ('Красная');
INSERT INTO attributes_values (value) VALUES ('Синий');
INSERT INTO attributes_values (value) VALUES ('32');
INSERT INTO attributes_values (value) VALUES ('35');
INSERT INTO attributes_values (value) VALUES ('39');
INSERT INTO attributes_values (value) VALUES ('40');
INSERT INTO attributes_values (value) VALUES ('43');
INSERT INTO attributes_values (value) VALUES ('49');
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 1);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 2);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 3);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 4);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 5);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 6);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 7);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 8);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 9);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 1);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 2);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 3);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 4);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 5);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 6);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 7);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 8);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 2, 9);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 1);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 2);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 3);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 4);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 5);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 6);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 7);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 8);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 1, 9);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 1);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 2);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 3);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 4);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 5);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 6);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 7);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 8);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (2, 2, 9);

Задача 3.
-- (A) (Написать SQL-запрос на определение количества товаров красного цвета) 
-- Запрос на опеределение товаров с заданым цветом по условию Красынй

SELECT count(products.name), attributes_values.`value`
FROM relations 
JOIN products ON relations.id_products = products.id 
JOIN attributes ON relations.id_attributes = attributes.id 
JOIN attributes_values ON relations.id_attributes_values = attributes_values.id 
WHERE (attributes_values.value = 'Красный')

+----------------------+----------------+
| count(products.name) | value          |
+----------------------+----------------+
|                    4 | Красный        |
+----------------------+----------------+
1 row in set (0.00 sec)
	
 
-- (B) Написать SQL-запрос для выборки Шарфа зеленого цвета и Шапки размера >= 40.   
-- Запрос на выборку Шарфа зеленого цвета и Шапки размера >= 40.  
SELECT products.name, attributes.name, attributes_values.value
FROM relations 
JOIN products ON relations.id_products = products.id
JOIN attributes ON relations.id_attributes = attributes.id
JOIN attributes_values ON relations.id_attributes_values = attributes_values.id
WHERE (products.name = 'Шарф' AND attributes_values.value = 'Зеленый' AND attributes.name = 'Цвет') OR (products.name = 'Шапка' AND attributes.name = 'Размер' AND attributes_values.value >= 40);

+------------+--------------+----------------+
| name       | name         | value          |
+------------+--------------+----------------+
| Шапка      | Размер       | 40             |
| Шапка      | Размер       | 43             |
| Шапка      | Размер       | 49             |
| Шарф       | Цвет         | Зеленый        |
+------------+--------------+----------------+
4 rows in set, 3 warnings (0.00 sec)







