-- Write your SQL code here
CREATE TRIGGER TrackProductAvailability
AFTER INSERT OR UPDATE OR DELETE ON Stock_Entity
FOR EACH ROW
BEGIN
    INSERT INTO Product_Availability_Log (Product_ID, Change_Time, Change_Type)
    VALUES (NEW.Product_ID, NOW(), 'Updated');
END;
CREATE TRIGGER MonitorStaffHours
AFTER INSERT OR UPDATE ON Staff_Entity
FOR EACH ROW
BEGIN
    DECLARE totalHours DECIMAL(10,2);
    SET totalHours = TIMESTAMPDIFF(HOUR, NEW.Check_In_Time, NEW.Check_Out_Time);
    UPDATE Staff_Entity
    SET Total_Working_Hours = Total_Working_Hours + totalHours
    WHERE Staff_ID = NEW.Staff_ID;
END;