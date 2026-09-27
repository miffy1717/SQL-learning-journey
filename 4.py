import pymysql

class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateTB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host = 'localhost',
            user = 'root',
            password= '1234',
            database='pysql'
        )
        self.c=self.db.cursor()

    def CreateTB(self):
        self.c.execute('''CREATE TABLE if not exists Company (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            location VARCHAR(100),
            capital DECIMAL(15, 2),
            employees_count INT,
            establishedAt DATE,
            monthly_expenses INT
        )''')

    def IncertTB(self):
        self.c.execute('''INSERT INTO Company (name, location, capital, employees_count, establishedAt, monthly_expenses)
            VALUES 
            ('Artel', 'Tashkent', 500000.00, 1500, '2011-01-15', 50000),
            ('AKFA', 'Tashkent', 800000.00, 2000, '2000-05-10', 80000),
            ('Texnopark', 'Tashkent', 300000.00, 800, '2019-06-20', 30000),
            ('SamAnt', 'Samarkand', 150000.00, 200, '2015-03-12', 12000),
            ('Buxoro Textile', 'Bukhara', 200000.00, 350, '2018-09-01', 18000)''')
        self.db.commit()

    def Alpha_name(self):
        self.c.execute('''select * from company order by name''')
        return (self.c.fetchall())

    def Capital(self):
        self.c.execute('''select * from company order by capital''')
        return(self.c.fetchall())

    def min_emp(self):
        self.c.execute('''select * from company order by employees_count''')
        return self.c.fetchone()

    def tash(self):
        self.c.execute('''select * from company where location = "tashkent"''')
        return self.c.fetchall()

    def everyloc(self):
        self.c.execute('select location, count(*) from company group by location')
        return self.c.fetchall()

    def ehhee(self):
        self.c.execute('select name, (curdate(month)-month(establishedAt))*monthly_expenses from company')
        return self.c.fetchall()

# mysql = MySQL()
# # mysql.IncertTB()
# for i in mysql.ehhee():
#     print(i)
# 6. Kompaniya tashkil topgan yilidan shu  yilga qadar qancha harajat qilgani haqida ma'lumotni ekranga chiqaring.
# ------------------------------------------------------------

class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateTB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host = 'localhost',
            user = 'root',
            password= '1234',
            database='pysql'
        )
        self.c=self.db.cursor()

    def CreateTB(self):
        self.c.execute('''CREATE TABLE if not exists Rest (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            address VARCHAR(150),
            maxFoodPrice DECIMAL(10, 2),
            minFoodPrice DECIMAL(10, 2),
            employeesCount INT,
            experience INT
        )''')

    def IncertTB(self):
        self.c.execute('''INSERT INTO Rest (name, address, maxFoodPrice, minFoodPrice, employeesCount, experience) VALUES
            ('Monamar', 'Tashkent, Chorsu', 150000.00, 25000.00, 15, 5),
            ('Master', 'Tashkent, Chilanzar', 200000.00, 30000.00, 20, 8),
            ('Mir', 'Samarkand, Center', 120000.00, 15000.00, 10, 3),
            ('Rayhon', 'Tashkent, Yunusabad', 180000.00, 20000.00, 25, 10),
            ('Navruz', 'Tashkent, Mirzo Ulugbek', 250000.00, 35000.00, 30, 12),
            ('SimSim', 'Tashkent, Yakkasaray', 300000.00, 40000.00, 40, 15),
            ('Meteora', 'Bukhara, Old City', 90000.00, 18000.00, 12, 2),
            ('Manor', 'Tashkent, Sergeli', 160000.00, 22000.00, 18, 6),
            ('Anhor', 'Tashkent, Shaykhantahur', 220000.00, 28000.00, 22, 7),
            ('Caravan', 'Tashkent, Yakkasaray', 280000.00, 45000.00, 35, 11)''')
        self.db.commit()

    def m_n(self):
        self.c.execute('''select * from rest where name like "m%" and name like "%r" order by maxFoodPrice''')
        return self.c.fetchall()

    def cheap(self):
        self.c.execute('''select * from rest order by minFoodPrice''')
        return self.c.fetchmany(3)

    def woooo(self):
        self.c.execute('''select name, maxfoodprice, experience from (select * from rest order by maxfoodprice desc limit 4) as expensive order by experience 
            ''')
        return self.c.fetchall()
    


food = MySQL()
# food.IncertTB()

# for i in food.m_n():
#     print(i)

# for i in food.cheap():
#     print(i)

# for i in food.woooo():
#     print(i)
# --------------------------------------------------------------

