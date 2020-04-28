import mysql.connector

config = {
  'user': 'root',
  'password': 'mysqlpass',
  'host': '127.0.0.1',
  'database': 'google_scholar_10k'
}

cnx = mysql.connector.connect(**config)
print("Connected to MySQL successfully!")

cursor = cnx.cursor()
query = ("SELECT * FROM articles WHERE name = 'Xiaoyi Ma';")
cursor.execute(query)

for x in cursor:
  print(x)

cursor.close()
cnx.close()