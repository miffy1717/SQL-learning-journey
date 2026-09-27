creATE database laptops;
use laptops;
create table pcs(brand text, model text, cpu text, frequency decimal(3,1) check (frequency<=5), ram int, os text, price int check (price between 400 and 3000));

insert into pcs (brand, model, cpu, frequency, ram, os, price) VALUES
('Apple', 'MacBook Air M1', 'Apple M1', 3.2, 8, 'macOS', 999),
('Apple', 'MacBook Pro 13', 'Apple M1', 3.2, 16, 'macOS', 1299),
('Apple', 'MacBook Air M2', 'Apple M2', 3.5, 8, 'macOS', 1199),
('Apple', 'MacBook Pro 14', 'Apple M2', 3.5, 16, 'macOS', 1999),
('ASUS', 'ZenBook 14', 'Intel Core i5', 2.4, 8, 'Windows 11', 750),
('ASUS', 'ROG Zephyrus', 'AMD Ryzen 7', 3.2, 16, 'Windows 11', 1450),
('ASUS', 'TUF Gaming', 'Intel Core i7', 2.6, 8, 'Windows 10', 899),
('ASUS', 'Vivobook 15', 'Intel Core i3', 2.0, 8, 'Windows 11', 450),
('Lenovo', 'ThinkPad E14', 'Intel Core i5', 2.4, 8, 'Windows 11', 650),
('Lenovo', 'IdeaPad 3', 'AMD Ryzen 5', 2.1, 8, 'Windows 10', 520),
('Lenovo', 'Legion 5', 'AMD Ryzen 7', 3.2, 16, 'Windows 11', 1300),
('Lenovo', 'Yoga Slim 7', 'Intel Core i7', 2.8, 16, 'Ubuntu 20.04', 1100),
('Dell', 'XPS 13', 'Intel Core i7', 2.8, 16, 'Windows 11', 1399),
('Dell', 'Inspiron 15', 'Intel Core i5', 2.4, 8, 'Windows 10', 580),
('Dell', 'G15 Gaming', 'AMD Ryzen 5', 3.3, 16, 'Windows 11', 950),
('Dell', 'Latitude 3520', 'Intel Core i3', 3.0, 4, 'Ubuntu 20.04', 420),
('HP', 'Pavilion 15', 'AMD Ryzen 5', 2.1, 8, 'Windows 11', 600),
('HP', 'Envy x360', 'Intel Core i7', 2.8, 16, 'Windows 11', 1050),
('HP', 'Victus 16', 'Intel Core i5', 2.5, 16, 'Windows 11', 850),
('HP', 'ProBook 450', 'Intel Core i5', 2.4, 8, 'Windows 10', 700);

1
select * from pcs order by price desc limit 1;
2
select * from pcs order by price asc limit 1;
3
select frequency from pcs where price between 400 and 1000 and cpu like "%intel%";
4 - count otilmagan
5
select * from pcs where os like "%windows%" and ram=8 and brand like "ASUS" order by price;

