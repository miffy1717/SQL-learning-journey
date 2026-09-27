-- 1
create database trade;
use trade;

CREATE TABLE sales_basic(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO sales_basic(product, quantity, price) VALUES
("Apple", 5, 3000),
("Apple", 2, 3000),
("Banana", 10, 2000),
("Banana", 3, 2000),
("Orange", 7, 2500),
("Orange", 4, 1500);

-- 1.1
select product, sum(quantity) from sales_basic group by product;

-- 1.2
select product, count(*) from sales_basic group by product;

-- 1.3
select product, avg(price) from sales_basic group by product;

-- 1.4
select * from sales_basic where quantity>5;

-- 1.5
select product, sum(quantity) as soni from sales_basic group by product having soni>6;

-- 2
use trade;
CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(50),
    order_year INT,
    price INT
);

INSERT INTO orders(product, order_year, price) VALUES
("Laptop", 2023, 1200),
("Laptop", 2023, 950),
("Laptop", 2024, 1500),
("Phone", 2023, 800),
("Phone", 2024, 900),
("Tablet", 2024, 600);

-- 2.1
select order_year, count(*) from orders group by order_year;

-- 2.2
select product, avg(price) from orders group by product;

-- 2.3
select * from orders where order_year=2023;

-- 2.4
select product, sum(price) as daromad from orders group by product having daromad>2000;

-- 2.5
select product, order_year, sum(price) as daromad from orders group by product, order_year;

-- 3
use trade;
CREATE TABLE city_sales(
    id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50),
    product VARCHAR(50),
    amount INT
);

INSERT INTO city_sales(city, product, amount) VALUES
("Tashkent", "TV", 400),
("Tashkent", "TV", 700),
("Tashkent", "Phone", 500),
("Samarkand", "Phone", 600),
("Samarkand", "Laptop", 1500),
("Bukhara", "TV", 300);

-- 3.1
select city, sum(amount) from city_sales group by city;

-- 3.2
select * from city_sales where product like "TV";

-- 3.3
select city, sum(amount) as daromad from city_sales group by city having daromad>1000;

-- 3.4
select city, sum(amount) as TV from city_sales where product like "TV" group by city;

-- 3.5
select city, count(distinct product) as xil from city_sales group by city having xil>==2;

-- 4
CREATE TABLE income_stats(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO income_stats(employee, department, salary) VALUES
("Ali", "IT", 1200),
("Vali", "IT", 1500),
("Ulugbek", "IT", 1100),
("Madina", "HR", 800),
("Gulnoza", "HR", 900),
("Sardor", "Finance", 1600);

-- 4.1
select department, max(salary) from income_stats group by department;

-- 4.2
select department, avg(salary) from income_stats group by department having avg(salary)>1000;

-- 4.3
select * from income_stats where department ='IT';

-- 4.4
select department, count(employee) from income_stats group by department;

-- 4.5
select department, sum(salary) from income_stats where department = 'HR' group by department;

-- 5
CREATE TABLE transactions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    category VARCHAR(50),
    amount INT
);

INSERT INTO transactions(user_name, category, amount) VALUES
("Aziz", "Food", 50),
("Aziz", "Food", 30),
("Aziz", "Tech", 400),
("Dilshod", "Food", 20),
("Dilshod", "Travel", 200),
("Shoxrux", "Tech", 900);

-- 5.1
select user_name, sum(amount) from transactions group by user_name;

-- 5.2
select category, sum(amount) from transactions where category = 'Tech' group by category;

-- 5.3
select user_name, max(amount) from transactions group by user_name;

-- 5.4
select user_name, sum(amount) from transactions group by user_name having sum(amount)>300;

-- 5.5
select user_name, count(distinct category) as xil from transactions group by user_name having xil=>2;