UPDATE students SET birth="2026-11-30";
UPDATE students SET name="Karim" WHERE id=1;
UPDATE students SET name="Karim", second="Valiyev" WHERE id=4;
UPDATE students SET salary=0 ORDER BY salary DESC LIMIT 1;

DELETE FROM students;
DELETE FROM students WHERE MONTH(birth) IN (12, 1, 2);

-------------------------------------------------------------------

ALTER TABLE students ADD test INT; -- TABLE oxiridan test nomli uustunni qo'shadi 
ALTER TABLE students ADD vazifa VARCHAR(10) FIRST;
ALTER TABLE students ADD joja SMALLINT AFTER name;

ALTER TABLE students DROP vazifa;
ALTER TABLE students 
    DROP test, 
    DROP joja, 
    ADD olma INT;

ALTER TABLE students MODIFY olma VARCHAR(20) FIRST;

ALTER TABLE students CHANGE olma apple INT AFTER id;

ALTER TABLE students RENAME TO talabalar;

-------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(25) UNIQUE,
    age INT DEFAULT 18,
    kurs INT NOT NULL
);

INSERT INTO students VALUES(1, "Karim", "KA@gmail.com", 15, 1);
INSERT INTO students(name,email,age,kurs) VALUES("Aziz", "aa@gmail.com", 18, 2);
INSERT INTO students(name, email, kurs) VALUES("Vali", "va@gmail.com", 1);
INSERT INTO students(name, email, kurs) VALUES("Kamron", "ka2@gmail.com", 3);
INSERT INTO students(name,email,age,kurs) VALUES("Aziza", "a2a@gmail.com", 81, 3);
INSERT INTO students(name,email,age,kurs) VALUES("Vali", "vaa@gmail.com", 19, 4);
INSERT INTO students(name,email,age,kurs) VALUES("Kamron", "aka@gmail.com", 15, 1);
INSERT INTO students(name,email,age,kurs) VALUES("Vali", "avva@gmail.com", 19, 1);
INSERT INTO students(name,email,age,kurs) VALUES("Aziz", "vvaa@gmail.com", 81, 2);

-------------------------------------------------------------------


SELECT * FROM students GROUP BY kurs;
+----+-------+---------------+------+------+--------+
| id | name  | email         | age  | kurs | scolar |
+----+-------+---------------+------+------+--------+
|  1 | Karim | KA@gmail.com  |   15 |    1 |   1000 |
|  2 | Aziz  | aa@gmail.com  |   18 |    2 |   1000 |
|  5 | Aziza | a2a@gmail.com |   81 |    3 |   1500 |
|  6 | Vali  | vaa@gmail.com |   19 |    4 |   1300 |
+----+-------+---------------+------+------+--------+

SELECT kurs, JSON_ARRAYAGG(name) FROM students GROUP BY kurs;
+------+-------------------------------------+
| kurs | JSON_ARRAYAGG(name)                 |
+------+-------------------------------------+
|    1 | ["Karim", "Vali", "Kamron", "Vali"] |
|    2 | ["Aziz"]                            |
|    3 | ["Aziza"]                           |
|    4 | ["Vali"]                            |
+------+-------------------------------------+


SELECT name, JSON_ARRAYAGG(kurs) AS kurs FROM students GROUP BY name;
+--------+-----------+
| name   | kurs      |
+--------+-----------+
| Aziz   | [2]       |
| Aziza  | [3]       |
| Kamron | [1]       |
| Karim  | [1]       |
| Vali   | [1, 4, 1] |
+--------+-----------+


SELECT name, JSON_ARRAYAGG(kurs) AS kurs, COUNT(*) AS miqdor FROM students GROUP BY name;
+--------+-----------+----------+
| name   | kurs      | miqdor   |
+--------+-----------+----------+
| Aziz   | [2, 2]    |        2 |
| Aziza  | [3]       |        1 |
| Kamron | [1]       |        1 |
| Karim  | [1]       |        1 |
| Vali   | [1, 4, 1] |        3 |
+--------+-----------+----------+

SELECT age, JSON_ARRAYAGG(name) AS name, JSON_ARRAYAGG(kurs) AS kurs, SUM(scolar) AS jami
FROM students 
GROUP BY age;
+------+---------------------+--------+-------------+
| age  | name                | kurs   | SUM(scolar) |
+------+---------------------+--------+-------------+
|   15 | ["Karim", "Kamron"] | [1, 1] |        2500 |
|   18 | ["Aziz", "Vali"]    | [2, 1] |        2000 |
|   19 | ["Vali", "Vali"]    | [4, 1] |        2600 |
|   81 | ["Aziza", "Aziz"]   | [3, 2] |        1500 |
+------+---------------------+--------+-------------+

-- HAVING SELECT DAN KEYIN ISHGA TUSHADI 
-- HAVING AGG FUNCTION 

SELECT age, JSON_ARRAYAGG(name) AS name, JSON_ARRAYAGG(kurs) AS kurs, SUM(scolar) AS jami
FROM students 
GROUP BY age
HAVING jami > 2000;
+------+---------------------+--------+------+
| age  | name                | kurs   | jami |
+------+---------------------+--------+------+
|   15 | ["Karim", "Kamron"] | [1, 1] | 2500 |
|   19 | ["Vali", "Vali"]    | [4, 1] | 2600 |
+------+---------------------+--------+------+


SELECT age, JSON_ARRAYAGG(name) AS name, JSON_ARRAYAGG(kurs) AS kurs, SUM(scolar) AS jami
FROM students
GROUP BY age
HAVING jami < 2000
ORDER BY COUNT(*) DESC;