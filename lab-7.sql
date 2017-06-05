0.//Дать список клиентов фирмы “ProTur”, заказавших путевки на тур “Римские каникулы”.
  SELECT client.name FROM putev
    LEFT JOIN tur ON putev.id_tur=tur.id_tur
    LEFT JOIN firm ON putev.id_firm=firm.id_firm
    LEFT JOIN zakaz ON putev.id_putev=zakaz.id_putev
    LEFT JOIN client ON zakaz.id_client=client.id_client
    WHERE tur.name="Римские каникулы" AND firm.name="ProTur";

 1.//Выдать список невостребованных до 20.05.12 путевок по всем фирмам с указанием названия тура, продолжительности тура, стоимости и начальной даты путевки
SELECT tur.name, tur.srok, putev.cost, putev.date_begin FROM zakaz
    LEFT JOIN putev ON zakaz.id_putev=putev.id_putev
    LEFT JOIN tur ON putev.id_tur=tur.id_tur
    LEFT JOIN firm ON putev.id_firm=firm.id_firm
    WHERE zakaz.date>="2012-05-20" AND zakaz.id_putev NOT IN(SELECT DISTINCT zakaz.id_putev FROM zakaz WHERE zakaz.date<"2012-05-20") GROUP BY putev.id_putev;

 2.//Дать выручку фирмы “Парус” по каждому туру, общая стоимость заказов на который, сделанных в апреле, превышала 100000.
SELECT SUM(putev.cost*zakaz.kol), tur.name AS profit
	FROM zakaz LEFT JOIN putev ON zakaz.id_putev=putev.id_putev
	LEFT JOIN tur ON putev.id_tur=tur.id_tur
	LEFT JOIN firm ON putev.id_firm=firm.id_firm
	WHERE firm.name="Парус" AND month(zakaz.date)=4 GROUP BY putev.id_tur HAVING SUM(putev.cost*zakaz.kol)>100000;


3.//Дать списки клиентов всех операторов фирмы “Пирамида”. Если у оператора нет клиентов, вывести NULL в поле фамилии клиента.
SELECT client.name FROM operat
	LEFT JOIN firm ON operat.id_firm=firm.id_firm
	LEFT JOIN zakaz ON operat.id_operat=zakaz.id_operat
	LEFT JOIN client ON zakaz.id_client=client.id_client
	WHERE  firm.name="Пирамида";

4.//Уменьшить на 25% стоимость “горящих” путевок, для которых дата начала тура до 31.05 включительно, а длительность тура не менее 10 дней.
UPDATE putev LEFT JOIN tur ON putev.id_tur=tur.id_tur
SET putev.cost = 0.75 * putev.cost 
WHERE putev.date_begin<="2017-05-31" AND tur.srok>=10; 
