import pymysql

class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateDB()
        self.CreateTB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host="localhost",
            # database="found216",
            user="root",
            password="1234",
        )
        self.c = self.db.cursor()

    def CreateDB(self):
        self.c.execute('''CREATE DATABASE IF NOT EXISTS palonchi''')
        self.c.execute("USE palonchi")

    def CreateTB(self):
        self.c.execute('''CREATE TABLE IF NOT EXISTS students(
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            age INT NOT NULL,
            course INT NOT NULL,
            scolarship INT NOT NULL,
            soha VARCHAR(50)
        )''')

    def InsertTB1(self):
        self.c.execute('''INSERT INTO students VALUES(
        1, "Karim", 34, 1, 1600, "Energetika")''')
        self.db.commit()

    def InsertTB2(self, ism, yosh, kurs, stip, soha):
        self.c.execute(f'''INSERT INTO students(name, age, course, scolarship, soha)
        VALUES("{ism}",{yosh},{kurs},{stip},"{soha}")''')
        self.db.commit()

    def DeleteStudent(self, id):
        self.c.execute(f'''DELETE FROM students WHERE id = {id}''')
        self.db.commit()

    def UpdateStudentName(self, new_name, id):
        self.c.execute(f'''UPDATE students SET name = "{new_name}" WHERE id={id}''')
        self.db.commit()

    def FirstQuery(self):
        self.c.execute(f'''SELECT * FROM students''')
        # print(self.c.fetchall())
        # print(self.c.fetchmany(2))
        print(self.c.fetchone())

    def SecondQuery(self):
        self.c.execute(f'''SELECT * FROM students WHERE name LIKE "%A%"''')
        return self.c.fetchall()

mysql = MySQL()
# for i in range(3):
#     mysql.InsertTB2(input("ISM: "), int(input("Yosh: ")), int(input("Kurs")), int(input("Stip: ")), input("Soha: "))
# mysql.DeleteStudent(1)
# mysql.UpdateStudentName("Olim", 3)
# mysql.FirstQuery()
for i in mysql.SecondQuery():
    print(i)


# AA1:

# School nomli database create qiling.

# Unga teachers nomli table qo'shing.
# Table:

# name : varchar(50),
# surname: varchar(50),
# salary: int,
# experience: int,
# branch: varchar(50)

# Kamida 7ta ustozlarni qo'shing.

# Unga students nomli table qo'shing.
# Table:

# name : varchar(50),
# surname: varchar(50),
# monthly_payment: int,
# course_duration: int,
# branch: varchar(50)

# Kamida 7ta o'quvchilarni qo'shing.


# 1. Ustozlarni maoshi bo'yicha o'sish tartibida tartiblab chiqaring.
# 2. 1. Ustozlarni maoshi bo'yicha o'sish va tajribasi  bo'yicha kamayish tartibida tartiblab chiqaring.
# 3.  Maoshi eng katta ustoz maoshini istalgan summaga kamaytiring.
# 4. Tajribasi eng katta ustozni "Chilonzor" branchga o'tkazing.
# 5. O'quvchilarni familiyasiga ko'ra tartiblab chiqaring.
# 6. O'quvchilarni oylik to'lov bo'yicha kamayish tartibida chiqaring.
# 7. Barcha o'quvchilarni markazga umumiy qancha summa to'lashlari kerakligini chiqaring (monthly_payment va course_duration dan foydalanib)
# 8. Markazga eng ko'p pul to'lovchi o'quvchini "Dubay" branchga o'tkazing.
# 9.  Bir branchdagi o'quvchi va ustozlar ro'yxatini chiqaring. (inner join)
# 10.  Ismi bir xil o'quvchilarning, o'qiydigan branchlari va ismlarini chiqaring.
# 11.  Familiyadosh o'quvchilarning oylik to'lov va familiyalarini ekranga chiqaring.