-- Creates a trigger that decreases the quantity of an item after adding a new
-- order.
CREATE TRIGGER on_order BEFORE INSERT ON orders
FOR EACH ROW 
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name
