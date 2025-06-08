DROP DATABASE IF EXISTS dealership;
CREATE DATABASE IF NOT EXISTS dealership;
USE dealership;
CREATE TABLE dealerships (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(50),
    address VARCHAR(50), 
    phone VARCHAR(12)
);
CREATE TABLE vehicles (
	VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10,2),
    SOLD BOOLEAN
);
CREATE TABLE inventory (
	dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
CREATE TABLE sales_contracts (
	contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sales_date DATE,
    sales_price DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, SOLD) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2020, 'Black', 15000, 22000.00, FALSE),
('1FMCU0F71JUA12345', 'Ford', 'Escape', 2019, 'Blue', 30000, 18500.00, FALSE),
('2T1BURHE0JC123456', 'Toyota', 'Corolla', 2021, 'White', 10000, 20000.00, TRUE);
INSERT INTO dealerships (name, address, phone) VALUES
('Comfort Auto', '123 Main St', '555-123-4567'),
('Elite Motors', '456 Oak Ave', '555-987-6543');
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '1FMCU0F71JUA12345'),
(2, '2T1BURHE0JC123456');
INSERT INTO sales_contracts (VIN, customer_name, sales_date, sales_price) VALUES
('2T1BURHE0JC123456', 'Jane Doe', '2025-06-01', 19500.00);
ALTER TABLE sales_contracts
ADD COLUMN dealership_id INT;
ALTER TABLE sales_contracts
ADD CONSTRAINT fk_sales_dealer
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id);
UPDATE sales_contracts
SET dealership_id = 2
WHERE contract_id = 1;