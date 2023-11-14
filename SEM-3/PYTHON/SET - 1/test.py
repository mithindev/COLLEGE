# import sqlite3

# con = sqlite3.connect("newdb.db")
# cur = con.cursor()
# print("Database created")

# cur.execute("""CREATE TABLE IF NOT EXISTS users(userid INT PRIMARY KEY,fname TEXT,lame TEXT,gender TEXT);""")
# con.commit()
# cur.execute("""CREATE TABLE IF NOT EXISTS orders(userid INT PRIMARY KEY,date TEXT,orderid TEXT,total TEXT);""")
# con.commit()

# cur.execute("""insert into users(userid,fname,lame,gender) values ('0001','Bruce','Wayyne','male');""")
# con.commit()
# cur.execute("""insert into users values ('00012','Brdduce','Waydwqyne','male');""")
# con.commit()

# cur.execute("""select * from users;""")
# a = cur.fetchall()
# print(a)
# cur.execute("""delete from users where fname="Brdduce";""")
# con.commit()
# cur.execute("""select * from users;""")
# a = cur.fetchall()
# print(a)

# more_doc = [('101', 'David', '1', '2005-2-10', 'Pediatric', '40000', None),
#             ('101', 'David', '1', '2005-2-10', 'Pediatric', '40000', None)
#             ]

class Solution:
    def maximumMeetings(self,n,start,end):
        meeting = [[start[i], end[i]] for i in range(len(end))]

        e = meeting[0][1]
        ans = 1

        for i in range(1, meeting.length):
            if i[1] > e:
                ans += 1
                e = i[1]
        
        return ans
