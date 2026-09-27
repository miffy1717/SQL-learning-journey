create database car_dealership_db;
use car_dealership_db;
create table cars(
    car_id int AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    manufacture_year int,
    price decimal(8,2),
    fuel_type VARCHAR(50)
);

INSERT INTO cars (brand, model, manufacture_year, price, fuel_type) VALUES
('Chevrolet', 'Malibu', 2022, 30000.00, 'Benzin'),
('Toyota', 'Camry', 2021, 28500.00, 'Benzin'),
('Tesla', 'Model 3', 2023, 40000.00, 'Elektr'),
('Hyundai', 'Sonata', 2020, 25000.00, 'Benzin'),
('BMW', 'X5', 2022, 60000.00, 'Dizel'),
('Audi', 'A4', 2021, 35000.00, 'Benzin'),
('Mercedes-Benz', 'C-Class', 2023, 55000.00, 'Dizel'),
('Kia', 'Sportage', 2020, 27000.00, 'Benzin'),
('Honda', 'Civic', 2022, 24000.00, 'Benzin'),
('Ford', 'Mustang', 2021, 45000.00, 'Benzin');

select * from cars order by manufacture_year;

select * from cars where fuel_type='benzin' and price>30000 order by price;

select fuel_type, min(price) as min_price from cars group by fuel_type;

---------------------------------------------------

create database electronics_db;
use electronics_db;
CREATE TABLE IF NOT EXISTS electronics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    discount INT DEFAULT 0
);

INSERT INTO electronics (category, brand, model, price, discount) VALUES
('Laptop', 'Apple', 'MacBook Pro 16 M3 Max', 38000000.00, 10),
('Laptop', 'Apple', 'MacBook Air 15 M2', 16500000.00, 15),
('Phone', 'Apple', 'iPhone 15 Pro Max', 17500000.00, 5),
('Phone', 'Samsung', 'Galaxy S24 Ultra', 16000000.00, 25),
('TV', 'Samsung', 'Neo QLED 4K 65"', 21000000.00, 30),
('Monitor', 'Samsung', 'Odyssey G9 49"', 14000000.00, 12),
('Laptop', 'Dell', 'XPS 15 9530', 24000000.00, 20),
('Laptop', 'Dell', 'Alienware m18', 32000000.00, 8),
('Monitor', 'Dell', 'UltraSharp 27 4K', 8500000.00, 18),
('Laptop', 'Asus', 'ROG Strix SCAR 18', 29000000.00, 22),
('Phone', 'Xiaomi', '14 Ultra', 13500000.00, 10),
('Tablet', 'Apple', 'iPad Pro 12.9 M2', 15500000.00, 14);

select * from electronics where price>15000000;

select * from electronics where brand like 'apple' or brand like 'samsung' or brand like 'dell';

--------------------------------------------------
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    pages INT NOT NULL,
    published_year INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL
);


create database company_db;
use company_db;

CREATE TABLE Employees (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Phone VARCHAR(15),
    Position VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Employees (FirstName, LastName, Age, Phone, Position, Department, Salary) VALUES
('Victoria', 'Sterling', 29, '+12025550143', 'Sales Executive', 'Sales', 85000.00),
('Alexander', 'Wright', 35, '+12025550188', 'Sales Manager', 'Sales', 120000.00),
('Lucas', 'Bennett', 31, '+442079460912', 'Software Engineer', 'IT', 145000.00),
('Sophia', 'Laurent', 28, '+33142685300', 'UX Designer', 'IT', 125000.00),
('Charlotte', 'Dub', 34, '+33142685311', 'HR Director', 'HR', 110000.00),
('Max', 'Vance', 42, '+12025550199', 'Executive Director', 'Management', 250000.00),
('Isabella', 'Rossi', 26, '+39066981234', 'Sales Specialist', 'Sales', 78000.00),
('Oliver', 'Tremblay', 33, '+12025550122', 'Marketing Lead', 'Marketing', 105000.00),
('Julian', 'Gallagher', 37, '+442079460845', 'Financial Analyst', 'Finance', 115000.00),
('Emma', 'Lindqvist', 27, '+46812345678', 'Sales Associate', 'Sales', 65000.00);

select * from Employees where department  = 'sales';

create database library;
use library;
create table books(id int PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(100) not null,
janr VARCHAR(50))