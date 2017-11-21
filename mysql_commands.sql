
CREATE TABLE products (`id` INT(10) NOT NULL AUTO_INCREMENT, `name` CHAR(10), `type` INT(10), PRIMARY KEY(`id`));
CREATE TABLE attributes (`id` INT(10) NOT NULL AUTO_INCREMENT, `name` CHAR(10), PRIMARY KEY(`id`));
CREATE TABLE attributes_values (`id` INT(10) NOT NULL AUTO_INCREMENT, `value` CHAR(10), `att_id` INT(10), `size` DECIMAL(10), PRIMARY KEY(`id`));
CREATE TABLE relations (`id_products` INT(10), `id_attributes` INT(10), `id_attributes_values` INT(10),
                    FOREIGN KEY (id_products) REFERENCES products(id),
                    FOREIGN KEY (id_attributes) REFERENCES attributes(id),
                    FOREIGN KEY (id_attributes_values) REFERENCES attributes_values(id));
 
  --Вставка записей
INSERT INTO products (name, type) VALUES ('Шапка', '5');
INSERT INTO products (name, type) VALUES ('Шарф', '6');
INSERT INTO attributes (name) VALUES ('Цвет');
INSERT INTO attributes_values (name, att_id, size) VALUES ('Зеленый', '1', '40');
INSERT INTO attributes_values (name, att_id, size) VALUES ('Красная', '1', '40');
INSERT INTO attributes_values (name, att_id, size) VALUES ('Синий', '1', '40');
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 1);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 2);
INSERT INTO relations(id_products, id_attributes, id_attributes_values) VALUES (1, 1, 3);


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
   

-- Выборка товара с кол-во цветов
SELECT count(products.name), attributes.`name`, attributes_values.`value`
FROM relations 
INNER JOIN products ON relations.id_products = products.id 
INNER JOIN attributes ON relations.id_attributes = attributes.id 
INNER JOIN attributes_values ON relations.id_attributes_values = attributes_values.id 
WHERE attributes_values.value = 'Красный'


//Выводит шапки

SELECT id_products, products.`name`, attributes.`name`, attributes_values.`value`
FROM relations
JOIN products ON relations.id_products = products.id
JOIN attributes ON relations.id_attributes = attributes.id
JOIN attributes_values ON relations.id_attributes_values = attributes_values.id
GROUP BY attributes_values.`value` = 'Красный'  


 
//Написать SQL-запрос для выборки Шарфа зеленого цвета и Шапки размера >= 40.   
 
SELECT products.name, attributes.name, attributes_values.value
FROM relations 
JOIN products ON relations.id_products = products.id
JOIN attributes ON relations.id_attributes = attributes.id
JOIN attributes_values ON relations.id_attributes_values = attributes_values.id
WHERE (products.name = 'Шарф' AND attributes_values.value = 'Зеленый' AND attributes.name = 'Цвет') OR (products.name = 'Шапка' AND attributes.name = 'Размер' AND attributes_values.value >= 40);










