-- Write your SQL code here
CREATE INDEX idx_client_id ON Order_Entity(Client_ID);
CREATE INDEX idx_product_id ON Order_Item(Product_ID);
CREATE INDEX idx_order_id ON Payment_Entity(Order_ID);
CREATE INDEX idx_staff_id ON Staff_Entity(Staff_ID);
CREATE INDEX idx_serial_number ON Stock_Entity(Serial_Number);
