0.
INSERT INTO client VALUES (NULL, 'Василий', 'Птичкин');

1.
INSERT INTO phone (phone, id_client, id_mobile_company) VALUES ('9340098123', 1, 1);

2.
INSERT INTO payment (id_connected_service) SELECT id_connected_service FROM connected_service;

3.
DELETE FROM payment;

4.
DELETE FROM type_of_service WHERE price < 200;

5.
TRUNCATE TABLE payment;

6.
UPDATE phone SET id_mobile_company = 1;

7.
UPDATE phone SET id_mobile_company = 2 WHERE id_client = 3;

8.
UPDATE type_of_service SET name = 'безлимитный интернет', price = 300 WHERE id_service = 1;

9.
SELECT price, name FROM type_of_service;

10.
SELECT * FROM client;

11.
SELECT * FROM phone WHERE id_client = 1;
