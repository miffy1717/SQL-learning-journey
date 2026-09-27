# AA1
import pymysql

class MySQL:
    def __init__(self):
        pass

    def connect_db(self):
        self.db = pymysql.connect(
            host='localhost',
            user='root',
            password='1234',
            database='school'
        )
        self.c = self.db.cursor()

    def create_tb(self):
        self.c.execute('create table ')

mysql = MySQL()
