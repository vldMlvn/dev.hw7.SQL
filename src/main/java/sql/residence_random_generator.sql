DELIMITER //
CREATE PROCEDURE generateResidence()

BEGIN
DECLARE iterator INT DEFAULT 0;
WHILE iterator < 200 DO
INSERT INTO residence (resident_id, apartment_id, date_start_stay, date_end_stay)
SELECT
FLOOR(RAND() * 200) + 1 AS resident_id,
FLOOR(RAND() * 120) + 1 AS apartment_id,
NOW() AS date_start_stay,
NULL AS date_end_stay;
SET iterator = iterator + 1;
END WHILE;
END //
DELIMITER ;

CALL generateResidence();

