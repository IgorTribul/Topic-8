DROP TRIGGER IF EXISTS check_name_insert //	
CREATE TRIGGER check_name_insert BEFORE INSERT ON products	
FOR EACH ROW	
BEGIN	
	DECLARE new_name VARCHAR(40);
	SET new_name = '!!! Enter the name of the product !!!';
	SET NEW.name = COALESCE(NEW.name, new_name);
END //	
	
DROP TRIGGER IF EXISTS check_description_insert //	
CREATE TRIGGER check_description_insert BEFORE INSERT ON products	
FOR EACH ROW	
BEGIN	
	DECLARE new_description VARCHAR(40);
	SET new_description = '!!! Enter the discription of the product !!!';
	SET NEW.description = COALESCE(NEW.description, new_description);
END //	
	
INSERT INTO shop.products (name, description) VALUES ('AMD 13567890', 'Processor')//	
INSERT INTO shop.products (description) VALUES ('Processor')//	
	
SELECT*FROM shop.products //	
	
	
DROP TRIGGER IF EXISTS check_name_description_update //	
CREATE TRIGGER check_name_description_update BEFORE UPDATE ON products	
FOR EACH ROW	
BEGIN	
	IF NEW.name IS NULL THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
	ELSEIF NEW.description IS NULL THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
	END IF;
END //	
	
UPDATE shop.products SET name=NULL WHERE id=1//	
UPDATE shop.products SET description=NULL WHERE id=2//	
	
SELECT*FROM shop.products //	
