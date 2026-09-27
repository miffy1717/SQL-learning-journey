5.1
SELECT user_name, SUM(amount) AS harajat FROM transactions GROUP BY user_name;
+-----------+---------+
| user_name | harajat |
+-----------+---------+
| Aziz      |     480 |
| Dilshod   |     220 |
| Shoxrux   |     900 |
+-----------+---------+

5.2
SELECT * FROM transactions WHERE category="Tech"
SELECT SUM(amount) FROM transactions WHERE category="Tech" GROUP BY category;
+-------------+
| SUM(amount) |
+-------------+
|        1300 |
+-------------+

5.3
SELECT user_name, MAX(amount) AS kattasi FROM transactions GROUP BY user_name;
+-----------+---------+
| user_name | kattasi |
+-----------+---------+
| Aziz      |     400 |
| Dilshod   |     200 |
| Shoxrux   |     900 |
+-----------+---------+

5.4
SELECT user_name, SUM(amount) AS harajat FROM transactions GROUP BY user_name HAVING harajat>300;

SELECT user_name, JSON_ARRAYAGG(category) FROM transactions
GROUP BY user_name HAVING COUNT(DISTINCT(category))>1;
+-----------+--------------------------+
| user_name | JSON_ARRAYAGG(category)  |
+-----------+--------------------------+
| Aziz      | ["Food", "Food", "Tech"] |
| Dilshod   | ["Food", "Travel"]       |
+-----------+--------------------------+

------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS pupil(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE phones(id INT AUTO_INCREMENT PRIMARY KEY, u_id INT, phone VARCHAR(30));

INSERT INTO pupil(name) VALUES ("Aziz"), ("Vali"), ("Olim");
INSERT INTO phones(u_id, phone) VALUES(2, "+99893123"), (1, "+99877777"), (2, "99814123"), (3, "+99897412"), (1, "+9890000"), (2,"+99891452");

SELECT * FROM pupil 
INNER JOIN phones ON pupil.id = phones.u_id;
+----+------+----+------+-----------+
| id | name | id | u_id | phone     |
+----+------+----+------+-----------+
|  2 | Vali |  1 |    2 | +99893123 |
|  1 | Aziz |  2 |    1 | +99877777 |
|  2 | Vali |  3 |    2 | 99814123  |
|  3 | Olim |  4 |    3 | +99897412 |
|  1 | Aziz |  5 |    1 | +9890000  |
|  2 | Vali |  6 |    2 | +99891452 |
+----+------+----+------+-----------+

SELECT name, JSON_ARRAYAGG(phone) FROM pupil AS p
INNER JOIN phones AS ph ON p.id = ph.u_id
GROUP BY name;
+------+----------------------------------------+
| name | JSON_ARRAYAGG(phone)                   |
+------+----------------------------------------+
| Aziz | ["+99877777", "+9890000"]              |
| Olim | ["+99897412"]                          |
| Vali | ["+99893123", "99814123", "+99891452"] |
+------+----------------------------------------+

SELECT p.id, name, JSON_ARRAYAGG(phone) FROM pupil AS p
INNER JOIN phones AS ph ON p.id = ph.u_id
GROUP BY name
HAVING count(*)>1;
+----+------+----------------------------------------+
| id | name | JSON_ARRAYAGG(phone)                   |
+----+------+----------------------------------------+
|  1 | Aziz | ["+99877777", "+9890000"]              |
|  2 | Vali | ["+99893123", "99814123", "+99891452"] |
+----+------+----------------------------------------+


SELECT * FROM pupil AS p
    -> INNER JOIN phones AS ph ON p.id = ph.u_id
    -> INNER JOIN students AS s ON P.ID = s.id;
+----+------+----+------+-----------+----+-------+--------------+------+------+--------+
| id | name | id | u_id | phone     | id | name  | email        | age  | kurs | scolar |
+----+------+----+------+-----------+----+-------+--------------+------+------+--------+
|  2 | Vali |  1 |    2 | +99893123 |  2 | Aziz  | aa@gmail.com |   18 |    2 |   1000 |
|  1 | Aziz |  2 |    1 | +99877777 |  1 | Karim | KA@gmail.com |   15 |    1 |   1000 |
|  2 | Vali |  3 |    2 | 99814123  |  2 | Aziz  | aa@gmail.com |   18 |    2 |   1000 |
|  1 | Aziz |  5 |    1 | +9890000  |  1 | Karim | KA@gmail.com |   15 |    1 |   1000 |
|  2 | Vali |  6 |    2 | +99891452 |  2 | Aziz  | aa@gmail.com |   18 |    2 |   1000 |
+----+------+----+------+-----------+----+-------+--------------+------+------+--------+


SELECT p.id, p.name, kurs, scolar, JSON_ARRAYAGG(phone) AS phones FROM pupil AS p
INNER JOIN phones AS ph ON p.id = ph.u_id
INNER JOIN students AS s ON P.ID = s.id
GROUP BY p.name;




----------------------------------------

CREATE TABLE odam(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(40));

CREATE TABLE qarz(id INT PRIMARY KEY, 
                    o_id INT, 
                    qarz INT,
                    FOREIGN KEY (o_id) REFERENCES odam(id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO odam VALUES(1, "Karim"), (2, "Vali");
INSERT INTO qarz VALUES(1, 1, 1000);