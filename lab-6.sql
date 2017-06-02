-- 4.0. LEFT JOIN двух таблиц + WHERE по 1 атрибуту
-- получить даты договоров,где имя клиента- Иван
SELECT data FROM contract
    LEFT JOIN client ON contract.id_client=client.id_client
    WHERE first_name="Иван";

-- 4.1. RIGHT JOIN двух таблиц, получить те же записи как в 4.1.
SELECT data FROM client
    RIGHT JOIN contract ON client.id_client = contract.id_client
    WHERE first_name="Иван";

-- 4.2. LEFT JOIN двух таблиц + WHERE по 2 атрибутам из 1 таблицы
-- получить даты договоров,где клиент- Иван Иванов
SELECT data FROM contract
    LEFT JOIN client ON contract.id_client=client.id_client
    WHERE last_name="Иванов" AND first_name="Иван";

-- 4.3. LEFT JOIN двух таблиц + WHERE по 1 атрибуту из каждой таблицы 
-- получить телефоны клиентов с именем Иван и датой договора 2017-05-28
SELECT phone FROM client
    LEFT JOIN contract ON client.id_client = contract.id_client
    WHERE client.first_name="Иван" AND contract.data="2017-05-28";

-- 4.4. LEFT JOIN трех таблиц + WHERE по 1 атрибуту из каждой таблицы
-- получить названия инвентаря из проката"Пимпочка" с ценой = 5600,ко-вом экземпляров = 432

    SELECT inventory.name FROM inventory
    LEFT JOIN inventory_in_rental ON inventory.id_inventory=inventory_in_rental.id_inventory
    LEFT JOIN rental_of_inventory ON inventory_in_rental.id_rental_of_inventory=rental_of_inventory.id_rental_of_inventory
    WHERE price=5600 AND number_of_exemplars=432 AND rental_of_inventory.name="Пимпочка";

-- 4.5. Подзапрос с IN
-- получить данные договоров клиента с именем Максим Петров
SELECT data, first_name, last_name, phone FROM contract
    LEFT JOIN client ON contract.id_client=client.id_client WHERE client.id_client IN (SELECT id_client FROM client WHERE last_name="Петров" AND first_name="Максим");


-- 4.6. Подзапрос с одним из операторов (= > < >= <= <> != <=> LIKE)
-- получить данные о самом дешевом инвентаре
SELECT name, price, number_of_exemplars FROM inventory
    LEFT JOIN inventory_in_rental ON inventory.id_inventory=inventory_in_rental.id_inventory WHERE price=(SELECT MIN(price) FROM inventory);

-- 4.7. ORDER BY 1 атрибут
-- получить данные договоров клиента с именем Максим Петров по  дате убывания
SELECT data, first_name, last_name, phone FROM contract
    LEFT JOIN client ON contract.id_client=client.id_client WHERE client.id_client IN (SELECT id_client FROM client WHERE last_name="Петров" AND first_name="Максим") ORDER BY data DESC;

-- 4.8. ORDER BY 2 атрибута
-- получить данные договоров клиента с именем Максим Петров по  дате убывания
SELECT * FROM client ORDER BY last_name, first_name;
