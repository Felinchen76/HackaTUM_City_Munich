import MySQLdb  # or pymysql, depending on the library you're using

connection = MySQLdb.connect(
    host='localhost', 
    user='root', 
    passwd='123', 
    db='user_management_db_hackatum'
)

cursor = connection.cursor()
cursor.execute("SELECT VERSION()")
version = cursor.fetchone()
print("MySQL version:", version)
cursor.close()
connection.close()
