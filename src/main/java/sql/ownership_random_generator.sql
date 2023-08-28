DELIMITER //
CREATE PROCEDURE generateOwnership1()

BEGIN
DECLARE iterator INT DEFAULT 0;
WHILE iterator < 120 DO
INSERT INTO resident_ownership ( resident_id, apartment_id)
SELECT
FLOOR(RAND() * 200) + 1 AS redisent_id,
iterator + 1 AS apartment_id;
SET iterator = iterator + 1;
END WHILE;
END //
DELIMITER ;


CALL generateOwnership1();
