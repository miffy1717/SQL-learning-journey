create database course_platform;
use course_platform;
create table courses(
    Course_ID int PRIMARY KEY AUTO_INCREMENT ,
    Title varchar(200) not null ,
    Instructor varchar(100) not null,
    DurationHr decimal(4,1) not null,
    Price DECIMAL(8,2) DEFAULT 0,
    Rating DECIMAL(2,1) DEFAULT 0 ,
    Enrolled INT DEFAULT 0
);

INSERT INTO courses (Title, Instructor, DurationHr, Price, Rating, Enrolled) VALUES
('Python Dasturlash Asoslari', 'Muhammad Ali', 25.5, 0, 4.8, 1250),
('Web Dasturlash (Full-Stack)', 'Sardor Qodirov', 40.0, 350000, 4.9, 980),
('SQL va Ma''lumotlar Bazasi', 'Muhammad Ali', 18.0, 0, 4.7, 1420),
('Grafik Dizayn (Figma)', 'Elena Kim', 15.0, 200000, 4.5, 650),
('Data Science Kirish', 'Muhammadrahim Toshov', 30.0, 450000, 4.9, 890),
('Frontend: React JS', 'Javohir Toshpulatov', 22.5, 0, 4.6, 1100),
('SMM va Raqamli Marketing', 'Malika Ikromova', 12.0, 150000, 4.3, 420),
('Cyber Security Asoslari', 'Muhammad Ali', 35.0, 500000, 4.8, 760),
('C++ Dasturlash Tili', 'Akmal Rustamov', 28.0, 0, 4.4, 530),
('Mobil Dasturlash (Flutter)', 'Sardor Qodirov', 32.0, 400000, 4.7, 810),
('English for IT Professionals', 'Nigora Ahmedova', 20.0, 180000, 4.6, 950),
('Java Backend Development', 'Muhammad Isoqov', 45.0, 600000, 4.9, 1150),
('Node.js va Express', 'Javohir Toshpulatov', 16.0, 0, 4.5, 600),
('UX/UI Dizayn Asoslari', 'Elena Kim', 14.5, 220000, 4.7, 390),
('DevOps va Docker', 'Muhammad Isoqov', 26.0, 550000, 4.8, 710);

select * from courses where Price=0;

select * from courses order by Enrolled desc limit 3;

select Instructor, sum(title) as guruxlar_soni from courses GROUP by Instructor;
------------------------------------------------------------------------

create database library_db;
use library_db;

create table books(
    BookID int AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    YearPublished YEAR NOT NULL, 
    PageCount INT NOT NULL,
    Price DECIMAL(6,2) DEFAULT 0,
    Available BOOLEAN DEFAULT TRUE
);

INSERT INTO books (Title, Author, Genre, YearPublished, PageCount, Price, Available) VALUES
('Otkan kunlar', 'Abdulla Qodiriy', 'Badiiy', 1926, 400, 85.00, TRUE),
('Sariq devni minib', 'Xudoyberdi Toxtaboyev', 'Bolalar', 1968, 280, 45.00, TRUE),
('Ufq', 'Otkir Hoshimov', 'Badiiy', 2018, 520, 120.00, TRUE),
('Sohibqiron', 'Alisher Navoiy', 'Tarixiy', 2016, 350, 95.00, FALSE),
('Dunyoning ishlari', 'Otkir Hoshimov', 'Badiiy', 2015, 210, 50.00, TRUE),
('Hamsa', 'Alisher Navoiy', 'Poeziya', 2019, 600, 150.00, TRUE),
('Mehrobdan chayon', 'Abdulla Qodiriy', 'Badiiy', 2012, 380, 75.00, FALSE),
('Yulduzli tunlar', 'Pirimqul Qodirov', 'Tarixiy', 2020, 480, 110.00, TRUE),
('Atom odatlari', 'James Clear', 'Rivojlanish', 2021, 320, 90.00, TRUE),
('Pythonda dasturlash', 'Ali Karimov', 'Informatika', 2022, 290, 130.00, TRUE),
('Boy ota va kambagal ota', 'Robert Kiyosaki', 'Moliya', 2017, 240, 65.00, FALSE),
('Ruhlar isyoni', 'Erkin Vohidov', 'Poeziya', 2014, 180, 40.00, TRUE);

select * from books where YearPublished>2015;
select * from books order by PageCount desc limit 3;
select * from books where Author like "ali%";
select Genre, count(*) from books GROUP by Genre;
--------------------------------------------------------------

create database transport_routes_db;
use transport_routes_db;

create table routes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    route_number VARCHAR(10) NOT NULL,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    duration_minutes INT NOT NULL,
    distance_km DECIMAL(5, 2) NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    bus_type VARCHAR(50) NOT NULL
);

INSERT INTO routes(route_number, start_location, end_location, duration_minutes, distance_km, ticket_price, bus_type) VALUES
('12', 'Boshliq mavzesi', 'Toshkent Vokzali', 45, 14.50, 1400.00, 'Shahar ichi'),
('21A', 'Yunusobod 19-mavze', 'Oloy bozori', 35, 11.20, 1850.00, 'Elektrobus'),
('28', 'Ippodrom', 'Toshkent Vokzali', 50, 16.80, 1804.00, 'Shahar ichi'),
('38', 'Sergeli-7 mavzesi', 'Chorsu bozori', 55, 18.20, 22800.00, 'Elektrobus'),
('51', 'Yunusobod 6-mavze', 'Beshyogoch maydoni', 40, 13.00, 2800.00, 'Shahar ichi'),
('72', 'Qoraqamish 2/4 mavzesi', 'Avtobeton zavodi', 48, 15.40, 11800.00, 'Shahar ichi'),
('75', 'Qoyliq bozori', 'Chorsu bozori', 60, 21.00, 18004.00, 'Tezyurar'),
('88', 'Toshkent TXAY', 'Dostlik metrosi', 30, 9.50, 18006.00, 'Shahar ichi'),
('91', 'Yunusobod 15-mavze', 'Kichik halqa yoli', 42, 12.80, 15800.00, 'Elektrobus'),
('115', 'Qoraqamish 1-mavze', 'Paxtakor metrosi', 38, 11.80, 1860.00, 'Shahar ichi'),
('131', 'Sergeli-4 mavzesi', 'Oloy bozori', 52, 17.10, 1800.50, 'Elektrobus'),
('151', 'Chilonzor 25-mavze', 'Toshkent Vokzali', 35, 10.50, 6700.00, 'Tezyurar');

UPDATE routes
SET ticket_price = CASE route_number
    WHEN '12'  THEN 2000.00
    WHEN '21A' THEN 2200.00
    WHEN '28'  THEN 2500.00
    WHEN '38'  THEN 2400.00
    WHEN '51'  THEN 1800.00
    WHEN '72'  THEN 2100.00
    WHEN '75'  THEN 3000.00
    WHEN '88'  THEN 1500.00
    WHEN '91'  THEN 2200.00
    WHEN '115' THEN 1800.00
    WHEN '131' THEN 2500.00
    WHEN '151' THEN 2800.00
    ELSE ticket_price
END;

select * from routes order by ticket_price;

select * from routes order by distance_km desc limit 3;

select * from routes where duration_minutes>30 and bus_type like "%shahar%";

select bus_type, (sum(ticket_price)/count(*)) as average_price from routes GROUP by bus_type order by average_price;
--------------------------------------------------------------------

create database company_db;
use company_db;

CREATE TABLE employees(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees(first_name, last_name, position, department, salary) VALUES
('Jamshid', 'Rakhimov', 'Dasturchi', 'Axborot texnologiyalari', 70000.00),
('Dildora', 'Tursunova', 'HR Menejeri', 'Kadrlar boshqarmasi', 65000.00),
('Nilufar', 'Karimova', 'Mahsulot Menejeri', 'Savdo', 80000.00),
('Rasul', 'Sobirov', 'UX Dizayneri', 'Dizayn studiyasi', 75000.00),
('Farida', 'Ismailova', 'Ma''lumotlarni Tahlilchi', 'Analitika bo''limi', 72000.00),
('Azamat', 'Karimov', 'Texnik Rivojlantiruvchi', 'Texnik xizmatlar', 67000.00),
('Nargiza', 'Tashkentova', 'HR Mutaxassisi', 'Kadrlar boshqarmasi', 60000.00),
('Alisher', 'Muradov', 'Biznes Tahlilchisi', 'Biznes bo''limi', 72000.00),
('Zohid', 'Salimov', 'Mahsulot Tahlilchisi', 'Savdo', 74000.00),
('Shahzod', 'Murodov', 'Dasturiy Ta''minot Mutaxassisi', 'Axborot texnologiyalari', 75000.00);

select department as bolim, first_name as ism, last_name as familiya, position as pozitsiya, salary as maosh;

SELECT 
    department AS "Bo'lim",
    first_name AS "Ism",
    last_name AS "Familiya",
    position AS "Pozitsiya",
    salary AS "Maosh"
FROM employees
ORDER BY department ASC;

select * from employees order by salary desc limit 5;

select department, count(*) as ishchilar from employees group by department order by ishchilar;