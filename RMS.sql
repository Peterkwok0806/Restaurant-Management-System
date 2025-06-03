--SEHS4514 Database Technologies and Management
--Kwok Mong Tat 24079330S 
--Submission date:16-04-2025 

CREATE TABLE Staff(
    Staff_id NUMBER(4),
    First_name VARCHAR2(10),
    Last_name VARCHAR2(10),
    Job VARCHAR2(10),
    Salary NUMBER(5),
    Hiredate DATE,
    Supervisor NUMBER(4),
    CONSTRAINT Staff_pk PRIMARY KEY(Staff_id),
    CONSTRAINT Staff_fk FOREIGN KEY(Supervisor) REFERENCES Staff(Staff_id)
);

CREATE TABLE Customers(
    Cust_id NUMBER(4),
    First_name VARCHAR2(10),
    Last_name VARCHAR2(10),
    Phone_no VARCHAR2(10),
    CONSTRAINT Customers_pk PRIMARY KEY(Cust_id)
);

CREATE TABLE Reward_points(
    Cust_id NUMBER(4),
    Reward_pt NUMBER(4),
    CONSTRAINT Reward_points_pk PRIMARY KEY (Cust_id),
    CONSTRAINT Reward_points_fk FOREIGN KEY (Cust_id) REFERENCES Customers(Cust_id)
);

CREATE TABLE Orders(
    Order_id NUMBER(4),
    Cust_id NUMBER(4),
    Staff_id NUMBER(4),
    Order_status VARCHAR2(10),
    Cost NUMBER(4),
    CONSTRAINT Orders_pk PRIMARY KEY(Order_id),
    CONSTRAINT Orders_cust_fk FOREIGN KEY(Cust_id) REFERENCES Customers(Cust_id),
    CONSTRAINT Orders_staff_fk FOREIGN KEY(Staff_id) REFERENCES Staff(Staff_id)
);

CREATE TABLE Menu(
    Menu_id number(3),
    Menuname VARCHAR2(20),
    Category VARCHAR2(10),
    Price NUMBER(3),
    Availability  VARCHAR2(20),
    CONSTRAINT Menu_pk PRIMARY KEY(Menu_id)
);

CREATE TABLE Order_Items(
    Order_id NUMBER(4),
    Menu_id NUMBER(3),
    Quantity NUMBER(2),
    CONSTRAINT Order_Items_pk PRIMARY KEY (Order_id, Menu_id),
    CONSTRAINT Order_Items_order_fk FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    CONSTRAINT Order_Items_menu_fk FOREIGN KEY (Menu_id) REFERENCES Menu(Menu_id)
);


INSERT INTO Staff(Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1001, 'David', 'Johnson', 'Manager', 5000, TO_DATE('2022-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO Staff (Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1002, 'John', 'Smith', 'Chef', 4500, TO_DATE('2022-05-12', 'YYYY-MM-DD'), 1001);
INSERT INTO Staff (Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1003, 'Fiona', 'Chow', 'Chef', 3500, TO_DATE('2022-11-24', 'YYYY-MM-DD'), 1002);
INSERT INTO Staff (Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1004, 'Charlie', 'Miller', 'Waiter', 3000, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 1001);
INSERT INTO Staff (Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1005, 'Jude', 'Law', 'Waiter', 2500, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 1004);
INSERT INTO Staff (Staff_id, First_name, Last_name, Job, Salary, Hiredate, Supervisor)
VALUES (1006, 'Harry', 'King', 'Waiter', 2300, TO_DATE('2023-12-26', 'YYYY-MM-DD'), 1004);

INSERT INTO Customers (Cust_id, First_name, Last_name, Phone_no) 
VALUES (2001, 'Alice','Becker','41112222');
INSERT INTO Customers (Cust_id, First_name, Last_name, Phone_no) 
VALUES (2002, 'Wataru','Tanaka','45896327');
INSERT INTO Customers (Cust_id, First_name, Last_name, Phone_no)
VALUES (2003, 'Harry','Morton','45492197');
INSERT INTO Customers (Cust_id, First_name, Last_name, Phone_no)  
VALUES (2004, 'Tyler','Potter','40825198');
INSERT INTO Customers (Cust_id, First_name, Last_name, Phone_no)
VALUES (2005, 'Conor','McConnell','40963748');

INSERT INTO Reward_points (Cust_id, Reward_pt) 
VALUES (2001, 101);
INSERT INTO Reward_points (Cust_id, Reward_pt) 
VALUES (2002,250);
INSERT INTO Reward_points (Cust_id, Reward_pt) 
VALUES (2003,178);
INSERT INTO Reward_points (Cust_id, Reward_pt) 
VALUES (2004, 67);
INSERT INTO Reward_points (Cust_id, Reward_pt) 
VALUES (2005, 25);

INSERT INTO Orders (Order_id, Cust_id, Staff_id, Order_status)
VALUES (4001, 2001, 1004, 'Completed');
INSERT INTO Orders (Order_id, Cust_id, Staff_id, Order_status)
VALUES (4002, 2004, 1004, 'Completed');
INSERT INTO Orders (Order_id, Cust_id, Staff_id, Order_status)
VALUES (4003, 2002, 1005, 'Pending');
INSERT INTO Orders (Order_id, Cust_id, Staff_id, Order_status)
VALUES (4004, 2005, 1005, 'Pending');
INSERT INTO Orders (Order_id, Cust_id, Staff_id, Order_status)
VALUES (4005, 2003, 1006, 'Pending');

INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (101, 'Caesar Salad', 'Starter', 4, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (102, 'Caesar Salad', 'Starter', 2, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (103, 'Grilled Chicken', 'Main', 15, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (104, 'Beef Steak', 'Main', 20, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (105, 'Margherita Pizza', 'Main', 10, 'Unavailable');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (106, 'Pasta Carbonara', 'Main', 13, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (107, 'Fruit Tart', 'Dessert', 3, 'Unavailable');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (108, 'Tiramisu', 'Dessert', 4, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (109, 'Chocolate Cake', 'Dessert', 5, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (110, 'Lemonade', 'Drink', 2, 'Available');
INSERT INTO Menu (Menu_id, Menuname, Category, Price, Availability)
VALUES (111, 'Iced Coffee', 'Drink', 2, 'Available');

INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4001, 101, 2);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4001, 103, 2);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4001, 108, 2);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4002, 104, 4);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4002, 110, 4);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4003, 102, 3);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4003, 106, 3);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4003, 111, 3);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4004, 104, 2);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4004, 111, 2);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4005, 103, 4);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4005, 109, 4);
INSERT INTO Order_Items (Order_id, Menu_id, Quantity)
VALUES (4005, 111, 4);

--Finding the famous menus
SELECT Menu_id, SUM(Quantity) as Total_Quantity
FROM Order_Items
WHERE Quantity > 1
GROUP BY Menu_id
HAVING SUM(Quantity) > 5
ORDER BY Total_Quantity DESC;

--Showing the detail of the order_itmes
SELECT oi.Order_id, oi.Menu_id, oi.Quantity, m.Menuname, m.Category, m.Price
FROM Order_Items oi, Menu m
WHERE oi.Menu_id = m.Menu_id;

--Finding the highest price menu in each Category
SELECT m.Category, m.Menuname, m.Price
FROM Menu m
WHERE m.Price = (
    SELECT MAX(Price)
    FROM Menu
    WHERE Category = m.Category
);

CREATE OR REPLACE PROCEDURE calculate_order_cost(p_order_id IN NUMBER)
IS
    v_total_cost NUMBER(4);
BEGIN
    SELECT SUM(oi.Quantity * m.Price)
    INTO v_total_cost
    FROM Order_Items oi, Menu m
    WHERE oi.Menu_id = m.Menu_id
    AND oi.Order_id = p_order_id;
    
    UPDATE Orders
    SET Cost = v_total_cost
    WHERE Order_id = p_order_id;
    
    COMMIT;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No items found for Order ID: ' || p_order_id);
    UPDATE Orders
        SET Cost = 0
        WHERE Order_id = p_order_id;
        COMMIT;
END calculate_order_cost;
/

CREATE OR REPLACE FUNCTION calculate_reward_points(p_order_id IN NUMBER)
RETURN NUMBER
IS
    v_total_cost NUMBER;
    v_points NUMBER;
BEGIN
    SELECT SUM(oi.Quantity * m.Price)
    INTO v_total_cost
    FROM Order_Items oi, Menu m
    WHERE oi.Menu_id = m.Menu_id
    AND oi.Order_id = p_order_id;

    v_points := FLOOR(v_total_cost / 10);
    RETURN v_points;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RETURN 0;
END calculate_reward_points;
/


CREATE OR REPLACE TRIGGER update_reward_points
AFTER UPDATE OF Order_status ON Orders
FOR EACH ROW
DECLARE
    v_points NUMBER;
BEGIN
    IF :NEW.Order_status = 'Completed'
    THEN v_points := calculate_reward_points(:NEW.order_id);

    UPDATE Reward_points
    SET Reward_pt = Reward_pt + v_points
    WHERE Cust_id = :NEW.Cust_id;
    END IF;
END update_reward_points;
/    


    

  




