//0.(COMMIT)
START TRANSACTION;  
    INSERT INTO inventory(price, name) VALUES (600, "веревка");
    INSERT INTO inventory(price, name) VALUES (6000, "мопед");
    INSERT INTO inventory(price, name) VALUES (9050, "лодка");
COMMIT;

//1.(ROLLBACK)
START TRANSACTION;
    INSERT INTO inventory(price, name) VALUES (600, "веревка");
    INSERT INTO inventory(price, name) VALUES (6000, "мопед");
    INSERT INTO inventory(price, name) VALUES (9050, "лодка");
ROLLBACK;

//2.Создать хранимую процедуру с параметрами и вызвать ее

DELIMITER $
CREATE FUNCTION get_max_price_of_inventory(name_of_inventory VARCHAR(255))
        RETURNS SMALLINT
BEGIN 
DECLARE max_price SMALLINT;
    SELECT MAX(price) INTO max_price FROM inventory WHERE name=name_of_inventory;
    RETURN (max_price);
END$
DELIMITER ;

SET @result = get_max_price_of_inventory("Грабли");
SELECT @result;



//3.Создать триггер и вызвать его
DELIMITER $
CREATE TRIGGER set_price BEFORE INSERT ON inventory_in_contract
FOR EACH ROW BEGIN
    SET @num := (SELECT number_of_exemplars FROM inventory_in_rental WHERE id_inventory_in_rental=NEW.id_inventory_in_rental);
    IF (NEW.number > @num)
    THEN
        SET NEW.number = 0;
    END IF;
END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER set_number AFTER INSERT ON inventory_in_contract
FOR EACH ROW BEGIN
    SET @num := (SELECT number_of_exemplars FROM inventory_in_rental WHERE id_inventory_in_rental=NEW.id_inventory_in_rental);
    IF (NEW.number <= @num)
    THEN
        UPDATE inventory_in_rental SET number_of_exemplars = @num - NEW.number  WHERE id_inventory_in_rental=NEW.id_inventory_in_rental;
    END IF;
END;$
DELIMITER ;

