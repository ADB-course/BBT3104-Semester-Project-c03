-- Write your SQL code here
CREATE FUNCTION CalculateTotalSalesByCategory(category VARCHAR(50)) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE totalSales DECIMAL(10,2);
    SELECT SUM(oi.Quantity * p.UnitPrice) INTO totalSales
    FROM Order_Item oi
    JOIN Product p ON oi.Product_ID = p.Product_ID
    WHERE p.Category = category;
    RETURN totalSales;
END;

CREATE FUNCTION GetCustomerTotalOrders(customerID INT) RETURNS INT
BEGIN
    DECLARE totalOrders INT;
    SELECT COUNT(*) INTO totalOrders
    FROM Order_Entity
    WHERE Client_ID = customerID;
    RETURN totalOrders;
END;