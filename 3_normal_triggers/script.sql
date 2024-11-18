CREATE TRIGGER PreventDuplicateOrders
BEFORE INSERT ON Order_Entity
FOR EACH ROW
BEGIN
    DECLARE existingOrderCount INT;
    SELECT COUNT(*) INTO existingOrderCount
    FROM Order_Entity
    WHERE Client_ID = NEW.Client_ID AND Order_Date = NEW.Order_Date;

    IF existingOrderCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate order detected.';
    END IF;
END;
CREATE TRIGGER UpdateProductQuantity
AFTER INSERT OR UPDATE ON Order_Item
FOR EACH ROW
BEGIN
    DECLARE newStock INT;
    SELECT Remaining_Stock INTO newStock
    FROM Stock_Entity
    WHERE Product_ID = NEW.Product_ID;

    SET newStock = newStock - NEW.Quantity;

    IF newStock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock.';
    ELSE
        UPDATE Stock_Entity
        SET Remaining_Stock = newStock
        WHERE Product_ID = NEW.Product_ID;
    END IF;
END;
CREATE TRIGGER CalculateTotalOrderAmount
AFTER INSERT OR UPDATE ON Order_Item
FOR EACH ROW
BEGIN
    DECLARE totalAmount DECIMAL(10,2);
    SET totalAmount = NEW.Quantity * (SELECT UnitPrice FROM Product WHERE Product_ID = NEW.Product_ID);
    UPDATE Order_Entity
    SET Total_Amount = Total_Amount + totalAmount
    WHERE Order_ID = NEW.Order_ID;
END;