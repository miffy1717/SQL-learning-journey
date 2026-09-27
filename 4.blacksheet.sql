create database school;
use school;

create table teachers(
    name varchar(50),
    surname varchar(50),
    salary int,
    experience int,
    branch varchar(50)
);

INSERT INTO teachers (name, surname, salary, experience, branch) VALUES
('John', 'Smith', 1200, 5, 'New York'),
('Anna', 'Lee', 1500, 7, 'Chicago'),
('Mark', 'Roy', 900, 3, 'Houston'),
('Alex', 'Cook', 2000, 10, 'Boston'),
('Jane', 'Day', 1100, 4, 'Miami'),
('Tom', 'Hall', 1300, 6, 'Seattle'),
('Emma', 'Rose', 1700, 8, 'Denver');

create table students(
    name varchar(50),
    surname varchar(50),
    monthly_payment int,
    course_durationduration int,
    branch varchar(50)
);

INSERT INTO students (name, surname, monthly_payment, course_duration, branch) VALUES
('Luke', 'Cole', 200, 6, 'New York'),
('Kate', 'Bell', 250, 12, 'Chicago'),
('Jack', 'Ford', 180, 4, 'Houston'),
('Lily', 'King', 300, 9, 'Boston'),
('Adam', 'West', 150, 3, 'Miami'),
('Mia', 'Page', 220, 6, 'Seattle'),
('Noah', 'Shaw', 280, 8, 'Denver');

select * from teachers order by salary;

update 