-- Write your SQL code here
START TRANSACTION;

-- Example transaction logic
-- Retrieve orders that are pending delivery
SELECT * FROM Order_Entity WHERE Order_Status = 'pending delivery';

-- Commit the transaction
COMMIT;