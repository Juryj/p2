Задача 2.
Есть MySQL база данных с такими таблицами:
"products" с полями:
-id
-name
-type
В таблице "products" такие записи:
id | name | type
------------------------
1 | Шарф | 5
2 | Шапка | 6

"attributes" с полями:
-id
-name
-product_id
В таблице "attributes" такие записи:
id | name | product_id
------------------------------
1 | цвет | 1
2 | цвет | 2

" attribute_values " с полями:
-id
-attribute_id
-value
В таблице "attribute_values" есть такие записи:
id | attribute_id | value
---------------------------
1 | 1 | зеленый
2 | 1 | красный
3 | 1 | синий

Нужно изменить структуру БД так, чтобы можно было сохранить только 3 товара: 

Шарф зеленого цвета,
Шарф красного цвета, 
Шапка красного цвета.

1. Первое условие - в таблице "attributes" не должно быть нескольких записей с названием "цвет".

2. Второе условие - в таблице "attribute_values" не должно быть нескольких значений

 "зеленый", "красный", "синий" (на каждый цвет 1 запись).

3. Третье условие - в таблице "products" не должно быть нескольких записей с наименованием 
"Шарф", "Шапка" (на каждый товар 1 запись).
