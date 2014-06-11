myTurkDB
========

MySQL and Python HIT and worker data scraper.

The purpose of this series of scripts is to set up and maintain a robust database with all of your Amazon Mechanical Turk data regarding worker st$

Currently the script consists of a single file (mturk.py) which will log into your account, scrape the data needed, and store the information into$

You will need to download and install http://www.mysql.com/downloads/
http://dev.mysql.com/doc/refman/5.1/...tallation.html
http://dev.mysql.com/doc/refman/5.1/...tallation.html
http://dev.mysql.com/doc/refman/5.1/...tallation.html

You will need to download and install https://www.python.org/download/releases/2.7.7/
Installers and instructions for Python 2.7.7 are included in the above link
If you don't want to manually install the extra modules, then get Pip, it works in all OS's and will make installing the modules much easier
https://pip.pypa.io/en/latest/installing.html

The extra modules you will need are:
BeautifulSoup: this module is used for parsing HTML. (http://www.crummy.com/software/BeautifulSoup/bs4/doc/)
pip install beautifulsoup4

Mechanize: this is the 'browser' the script uses. (http://wwwsearch.sourceforge.net/mechanize/)
pip install mechanize

MySQLdb: this connects to MySQL. (http://mysql-python.sourceforge.net/MySQLdb.html)
pip install mysql-python


Still with me? Good! The hardest part is done. From here we will need to set up the database and tables for MySQL. Since I'm such a swell guy, bel$


This will set up the database and the user.

        create database mturk;

        grant usage on *.* to mturk@localhost identified by 'mturk';

        grant all privileges on mturk.* to mturk@localhost;

        mysql -u mturk -p'mturk' mturk

This will set up the tables.

        CREATE TABLE hitdb (hitId VARCHAR(100), date DATE, requesterName VARCHAR(100), requesterId VARCHAR(50), title VARCHAR(200), reward FLOAT, $

        ALTER TABLE hitdb ADD PRIMARY KEY (hitId);

        CREATE TABLE workerdb (workerId VARCHAR(50), workerName VARCHAR(50), bonus FLOAT, transfer FLOAT);

        ALTER TABLE workerdb ADD PRIMARY KEY (workerId);

Export your CSV from HitDB, then open up the file and remove the first line. It should look like:
        hitId,date,requesterName,requesterId,title,reward,status,feedback

You'll want to log into mysql as root ( mysql -u root -p ) and run:

        LOAD DATA INFILE '/location/of/mturkdb' INTO TABLE hitdb FIELDS TERMINATED BY ',' (hitId,@var1,requesterName,requesterId,title,reward,stat$

replacing /location/of/mturkdb with the location to your HITdb csv file, and replacing YourWorkerID with your worker id.
