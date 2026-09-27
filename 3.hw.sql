-- NAVOIY YOZGAN JANRLAR RO'YXAT
-- BARCHA AUTHORLARNING YOZGAN JANRLARI

-- BARCHA AUTHOR LARNING JANRLARI BO'YICHA NECHTADAN KITOB YOZGAN

-- ENG KO'P YOZILGAN JANR

-- HAR BIR AUTHOR QAYSI JANR DA KO'P IJOD QILGAN

-- KIM NI KITOBI ENG KO'P SOTILGAN

create database NAVOIY;
use NAVOIY;
create table books(
    id int AUTO_INCREMENT primary key,
    title varchar(20),
    author varchar(20),
    genre text,
    sales int
);

INSERT INTO books (title, author, genre, sales) VALUES
('Xamsa', 'Navoiy', 'Dastan', 15000),
('Lison ut-Tayr', 'Navoiy', 'Dastan', 8000),
('Mahbub ul-Qulub', 'Navoiy', 'Prose', 6000),
('Mezon ul-Avzon', 'Navoiy', 'Poetry Theory', 4000),
('O`tkan kunlar', 'Abdulla Qodiriy', 'Novel', 25000),
('Mehrobdan chayon', 'Abdulla Qodiriy', 'Novel', 18000),
('Dunyoning ishlari', 'O`tkir Hoshimov', 'Prose', 20000),
('Ikki eshik orasi', 'O`tkir Hoshimov', 'Novel', 22000);

select distinct genre from books where author = 'navoiy';

select author, json_arrayagg(genre) from books group by author;

select genre, count(genre) as c from books group by genre order by c desc limit 1;

select author, genre, count(*) from books group by author, genre order by count(*) desc;

select author, count(*) as sold_books from books group by author limit 1;