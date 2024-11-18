-- Write your SQL code here
ALTER TABLE Payment_Entity
ADD CONSTRAINT chk_payment_amount CHECK (Amount_Paid >= (SELECT Total_Amount FROM Order_Entity WHERE Order_ID = Payment_Entity.Order_ID));

ALTER TABLE Order_Item
ADD CONSTRAINT chk_order_quantity CHECK (Quantity > 0);

ALTER TABLE Order_Entity
ADD CONSTRAINT chk_delivery_date CHECK (Expected_Delivery_Date > Order_Date);