DELIMITER //	
DROP FUNCTION IF EXISTS hello //	
CREATE FUNCTION hello()	
RETURNS VARCHAR(255) DETERMINISTIC 	
BEGIN 	
	DECLARE time_now INT;
	SET time_now = TIME_TO_SEC(NOW());
	IF time_now >= 64800 THEN
	RETURN 'good evening';
	ELSEIF time_now >= 43200 THEN
	RETURN 'good day';
	ELSEIF time_now >= 21600 THEN
	RETURN 'good morning';
	ELSE
	RETURN 'good night';
	END IF;
END //	
SELECT hello()//	
