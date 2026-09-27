create database student;
use student;
create table info(id int, name text, age int, grade decimal(5,2));
insert into info values(1, 'jacob', 16, 67),
(2, 'jack', 12, 92),
(3, 'david', 28, 45),
(4, 'stephany', 17, 100),
(5, 'lily', 15, 80),
(6, 'jessica', 18, 20);

select * from info where grade between 90 and 100 order by name desc;

select * from info where grade between 67 and 90  order by age desc;

select * from info where grade between 0 and 66  order by grade;

create database local_food;
create table meals(id int, name text, prducts text);

INSERT INTO meals VALUES
(1, 'osh', 'rice, carrot, beef, chickpea'),
(2, 'somsa', 'flour, beef, onion, cumin'),
(3, 'lagman', 'noodles, beef, bell pepper, tomato'),
(4, 'manti', 'dough, minced meat, onion, black pepper'),
(5, 'shashlik', 'beef, onion, spices, vinegar'),
(6, 'shurpa', 'lamb, potato, carrot, onion'),
(7, 'norin', 'noodle dough, horse meat, onion'),
(8, 'kazan kabob', 'beef, potato, oil, spices'),
(9, 'dimlama', 'beef, cabbage, potato, carrot'),
(10, 'chuchvara', 'dough, minced meat, broth, sour cream');

select * from meals where name like "%a"

select * from meals where prducts like "%onion%"

create database workers;
create table info(id int, name text, b_date date, grade int)

create database market;
create table products(id int, name varchar(10), price float, qyt int);
insert into products values(1, 'apple', 12000, 50),
(2, 'banana', 18000, 30),
(3, 'milk', 14000, 20);

select * from prducts where price>13000;

______________________________________________________
create database bus_directions;
use bus_directions;
create table routes(id int, start varchar(50), end varchar(50), distance float);

insert into routes values(1, 'toshkent', 'samarqand', 300), 
(2, 'samarqand', 'buxoro', 270),
(3, 'buxoro', 'xiva', 450);

select * from routes where distance>300;


create database book_shop;
use book_shop;
create table books(id int, title varchar(50), author varchar(50), price float);
insert into books values('1', 'itendswithus', 'collenhoover', 23.45),
('1', 'itendswithus', 'collenhoover', 12.34),
('1', 'itendswithus', 'collenhoover', 45.23);

select* from books where price>20;

______________________________________________________
create database cinema;
use cinema;
create table movies(id int, name varchar(50), start time, price float);
insert into movies values
(2,'Titanic', '13:00:00', 40000),
(3, 'Matrix', '15:00:00', 60000);

select * from movies where start < 12:00;

