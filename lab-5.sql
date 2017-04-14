
0.получить 2 первые оплаты
SELECT * FROM 'payment' LIMIT 2;

1.получить владельцев квартир,фамилии которых не указаны
SELECT * FROM 'owner' WHERE 'last_name' IS NULL;

2.получить квартиры,у которых указан адрес
SELECT * FROM 'flat' WHERE 'address' IS NOT NULL;

3.получить тарифы,у которых цена за еденицу между 1 и 70 включительно
SELECT * FROM 'utility_tariff' WHERE 'unit_price' BETWEEN 1 AND 70;

4.получить тарифы,у которых цена за еденицу 6 и 27
SELECT * FROM 'utility_tariff' WHERE 'unit_price' IN (6, 27);

5.получить оплаты,у которых id_flat =2
SELECT * FROM 'payment' WHERE 'id_flat'=2;

6.получить оплаты,у которых id_cashier !=1
SELECT * FROM 'payment' WHERE 'id_cashier'!=1;

7.получить тарифы в порядке возрастания цены за единицу
SELECT * FROM 'utility_tariff' ORDER BY 'unit_price' ASC;

8.получить тарифы в порядке убывания цены за единицу
SELECT * FROM 'utility_tariff' ORDER BY 'unit_price' DESC;

9.получить тарифы в порядке возрастания цены за единицу и алфовитном порядке
SELECT * FROM 'utility_tariff' ORDER BY 'unit_price','name';

10.получить все названия тарифов и цену за единицу ,отсортированных по названию
SELECT 'name','unit_price' FROM 'utility_tariff' ORDER BY 1;

11.получить минимальную цену за единицу
SELECT MIN('unit_price') FROM 'utility_tariff';

12.получить максимальную цену за единицу
SELECT MAX('unit_price') FROM 'utility_tariff';

13.получить среднюю зарплату кассиров
SELECT AVG('salary') FROM 'cahier';

14.получить сумму всех зарплат кассиров
SELECT SUM('salary') FROM 'cahier';

15.получить все разные зарплаты кассиров
SELECT DISTINCT 'salary' FROM 'cahier';

16.получить количество кассиров с разными зарплатами
SELECT COUNT(DISTINCT 'salary') FROM 'cahier';

17.получить количество расхода по всем тарифам
SELECT SUM('cost') FROM 'payment' GROUP BY 'id_utility_tariff';

18.получить количество расхода по тарифу 2
SELECT SUM('cost') FROM 'payment' WHERE 'id_utility_tariff'=2 GROUP BY 'id_utility_tariff';

19.получить тарифы,суммарный расход которых меньше 100
SELECT 'id_utility_tariff' ,SUM('cost') FROM 'payment' GROUP BY 'id_utility_tariff' HAVING SUM('cost')<100;
