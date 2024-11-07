-- Creates a stored procedure `AddBonus` that adds 
-- a new correction for a student.
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus (
    user_id VARCHAR(255),
    project_name VARCHAR(255), 
    score INT)
BEGIN
    DECLARE project_id INT;

    SELECT id INTO project_id FROM projects WHERE name = project_name;
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO corrections VALUES (user_id, project_id, score);
END;$$

DELIMITER ;
