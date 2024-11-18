-- Write your SQL code here
INSERT INTO Client_Entity (Client_Name, Address, Phone, Email) VALUES 
('John Doe', '123 Elm St', '555-1234', 'john@example.com'),
('Jane Smith', '456 Oak St', '555-5678', 'jane@example.com');

INSERT INTO Product (Product_Name, Category, UnitPrice) VALUES 
('Water Pump', 'Irrigation', 150.00),
('Solar Panel', 'Solar Solutions', 200.00);

INSERT INTO Stock_Entity (Serial_Number, Product_ID, Remaining_Stock, Reorder_Level) VALUES 
('SN12345', 1, 50, 10),
('SN67890', 2, 30, 5);
INSERT INTO Order_Entity (Client_ID, Expected_Delivery_Date, Total_Amount, Order_Status) VALUES 
(1, '2024-11-25 10:00:00', 300.00, 1);

INSERT INTO Order_Item (Order_ID, Product_ID, Quantity) VALUES 
(1, 1, 2),
(1, 2, 1);

INSERT INTO Payment_Entity (Order_ID, Amount_Paid, Payment_Method) VALUES 
(1, 300.00, 'Mobile Money');

INSERT INTO Staff_Entity (Staff_Name, Check_In_Time, Check_Out_Time, Salary, Department, KRA_Pin) VALUES 
('Alice Johnson', '2024-11-18 08:00:00', '2024-11-18 17:00:00', 5000.00, 'Sales', 'KRA123456');
