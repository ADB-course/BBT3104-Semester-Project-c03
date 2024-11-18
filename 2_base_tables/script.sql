-- Write your SQL code here- Create Tables
CREATE TABLE Client_Entity (
    Client_ID INT AUTO_INCREMENT PRIMARY KEY,
    Client_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE Stock_Entity (
    Serial_Number VARCHAR(30) PRIMARY KEY,
    Product_ID INT,
    Remaining_Stock INT NOT NULL,
    Reorder_Level INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
) ENGINE=InnoDB;

CREATE TABLE Order_Entity (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Client_ID INT,
    Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Expected_Delivery_Date TIMESTAMP,
    Total_Amount DECIMAL(10, 2),
    Order_Status TINYINT,
    FOREIGN KEY (Client_ID) REFERENCES Client_Entity(Client_ID)
) ENGINE=InnoDB;
CREATE TABLE Order_Item (
    Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Order_Entity(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
) ENGINE=InnoDB;
CREATE TABLE Payment_Entity (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount_Paid DECIMAL(10, 2) NOT NULL,
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Order_ID) REFERENCES Order_Entity(Order_ID)
) ENGINE=InnoDB;
CREATE TABLE Staff_Entity (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Staff_Name VARCHAR(100) NOT NULL,
    Check_In_Time TIMESTAMP,
    Check_Out_Time TIMESTAMP,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    KRA_Pin VARCHAR(15)
) ENGINE=InnoDB;
