
-- tables
-- Table Customer
CREATE TABLE Customer (
    name varchar(50)  NOT NULL,
    email varchar(50)  NOT NULL,
    cust_id int  NOT NULL  AUTO_INCREMENT,
    CONSTRAINT Customer_pk PRIMARY KEY (cust_id)
);

-- Table `Order`
CREATE TABLE `Order` (
    order_id int  NOT NULL  AUTO_INCREMENT,
    date text  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (order_id)
);

-- Table Order_Customer
CREATE TABLE Order_Customer (
    cust_id int  NOT NULL,
    order_id int  NOT NULL,
    UNIQUE INDEX Order_Customer_ak_1 (cust_id,order_id)
);

-- Table Order_Product
CREATE TABLE Order_Product (
    SKU bigint  NOT NULL,
    order_id int  NOT NULL,
    qty int  NOT NULL,
    UNIQUE INDEX Order_Product_ak_1 (SKU,order_id)
);

-- Table Product
CREATE TABLE Product (
    name varchar(50)  NOT NULL,
    SKU bigint  NOT NULL  AUTO_INCREMENT,
    price double(6,2)  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY (SKU)
);





-- foreign keys
-- Reference:  Order_Customer_Customer (table: Order_Customer)

ALTER TABLE Order_Customer ADD CONSTRAINT Order_Customer_Customer FOREIGN KEY Order_Customer_Customer (cust_id)
    REFERENCES Customer (cust_id);
-- Reference:  Order_Customer_Order (table: Order_Customer)

ALTER TABLE Order_Customer ADD CONSTRAINT Order_Customer_Order FOREIGN KEY Order_Customer_Order (order_id)
    REFERENCES `Order` (order_id);
-- Reference:  Order_Product_Order (table: Order_Product)

ALTER TABLE Order_Product ADD CONSTRAINT Order_Product_Order FOREIGN KEY Order_Product_Order (order_id)
    REFERENCES `Order` (order_id);
-- Reference:  Order_Product_Product (table: Order_Product)

ALTER TABLE Order_Product ADD CONSTRAINT Order_Product_Product FOREIGN KEY Order_Product_Product (SKU)
    REFERENCES Product (SKU);



-- End of file.

