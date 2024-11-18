-- Write your SQL code here
CREATE PROCEDURE GetOrdersByDateRange(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT * FROM Order_Entity
    WHERE Order_Date BETWEEN startDate AND endDate;
END;

CREATE PROCEDURE GetStaffPerformance(IN department VARCHAR(50))
BEGIN
    SELECT s.Staff_Name, COUNT(o.Order_ID) AS TotalOrders
    FROM Staff_Entity s
    JOIN Order_Entity o ON s.Staff_ID = o.Assigned_Staff_ID
    WHERE s.Department = department
    GROUP BY s.Staff_Name;
END;