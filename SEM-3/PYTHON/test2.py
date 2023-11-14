import sqlite3

con = sqlite3.connect("python_db.db")
cur = con.cursor()

cur.execute("""CREATE TABLE IF NOT EXISTS Hospital(Hospital_id INT PRIMARY KEY,Hospital_Name TEXT,Bed_Count TEXT);""")
cur.execute("""CREATE TABLE IF NOT EXISTS Doctor(Docter_id INT PRIMARY KEY,Doctot_Name TEXT,Hospital_id INT,Joining_Date TEXT,Speciality TEXT,Salary TEXT,Experience TEXT);""")
con.commit()

lis = [('104', 'Robert', 2, '2017-12-28', 'Pediatric', '28000', None),('105', 'Linda', 3, '2006-06-04', 'Garnacologist', '42000', None)]

cur.executemany("INSERT INTO Doctor (Docter_id, Doctot_Name, Hospital_id, Joining_Date, Speciality, Salary, Experience) VALUES (?, ?, ?, ?, ?, ?, ?);", lis)
con.commit()

cur.execute("SELECT * FROM Doctor;")
results = cur.fetchall()
print(results)
