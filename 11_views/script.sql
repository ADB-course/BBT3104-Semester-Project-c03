-- Write your SQL code here
CREATE VIEW SalesTeamView AS
SELECT 
    o.Order_ID,
    c.Client_Name,
    p.Product_Name,
    oi.Quantity,
    p.UnitPrice,
    (oi.Quantity * p.UnitPrice) AS TotalPrice
FROM 
    Order_Entity o
JOIN Client_Entity c ON o.Client_ID = c.Client_ID
JOIN Order_Item oi ON o.Order_ID = oi.Order_ID
JOIN Product p ON oi.Product_ID = p.Product_ID;
CREATE VIEW InventoryView AS
SELECT 
    p.Product_Name,
    p.Category,
    s.Remaining_Stock,
    p.Reorder_Level
FROM 
    Product p
JOIN Stock_Entity s ON p.Product_ID = s.Product_ID
WHERE s.Remaining_Stock <= p.Reorder_Level;