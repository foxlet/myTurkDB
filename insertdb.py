import MySQLdb
import time

dbdict = {}
dbcsv = open('mturkdb','r')

for line in dbcsv:
	line = line.replace("'", "\\'")
	line = line.replace('""', '"NA"')
	line = line.replace('"',"'")
	linelist = line.split(',')
	if len(linelist) < 2:
		pass
	else:
		line = ",".join(linelist)
		dictlen = len(dbdict)
		dbdict[dictlen] = line

#Database insertion, surely this will work..right? RIGHT?!
insert_into = "INSERT INTO mturk.hitdb(hitId, date, requesterName, requesterId, title, reward, status, feedback) VALUES"
db = MySQLdb.connect(host="localhost", user="user", passwd="passwd", db="mturk")

cur = db.cursor()

for key,value in dbdict.iteritems():
	try:
		statement = insert_into + "(" + value.strip() + ");"
		statement = statement.strip()
		cur.execute(statement)
	except:
		print value

db.commit()
