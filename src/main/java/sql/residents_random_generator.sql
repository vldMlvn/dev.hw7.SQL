DELIMITER //
CREATE PROCEDURE generateResidents1()
BEGIN
DECLARE iterator INT DEFAULT 0;
DECLARE alphabet CHAR(26) DEFAULT 'abcdefghijklmnopqrstuvwxyz';
WHILE iterator < 200 DO
INSERT INTO resident (name, lastname, phone, email, car_access)
SELECT 
SUBSTRING(alphabet, FLOOR(1 + RAND() * 26), 5) AS name,
SUBSTRING(alphabet, FLOOR(1 + RAND() * 26), 5) AS lastname,
CONCAT(FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9), FLOOR(RAND() * 9)) AS phone,
CONCAT('user', iterator, '@example.com') AS email,
FLOOR(RAND() * 2) AS car_access;
SET iterator = iterator + 1;
END WHILE;
END //
DELIMITER ;

CALL generateResidents1();







