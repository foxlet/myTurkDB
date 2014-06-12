Setting up myTurkDB Manually
========

These are platform-independent instructions to manually setup an user's environment for myTurkDB

##### Requisites

+ An OS capable of connecting to the internet
+ Python 2.7.2 or later
+ A C/C++ compatible compiler or systemwide compiling toolkit.
+ A git-compatible client or revision control system, to grab the latest trunk


#### Dependencies Installation

To begin, grab the latest trunk using your favorite Git client from

https://github.com/DeliriumNocturnum/myTurkDB.git

The script requires manual setup of MySQL and the initial tables (one for hits, one for workers), as well as the manual setup of Python and a few modules. If you don't know what any of that means, don't worry: some OSes (Linux, OS X) have setup scripts available in the "Quick Setup" folder in the latest trunk.

1. You will need to download and install **MySQL**

 + http://www.mysql.com/downloads/

 + http://dev.mysql.com/doc/refman/5.1/en/installing.html

2. You will need to download and install **Python 2.7.X**

 + https://www.python.org/download/releases/2.7.7/

#### Required Python modules

Install the following Python modules...

*If you don't want to manually install the extra modules, then get Pip, it works in most OS's and will make installing the modules much easier.*

*https://pip.pypa.io/en/latest/installing.html*

The extra modules you will need are:

+ BeautifulSoup: this module is used for parsing HTML. (http://www.crummy.com/software/BeautifulSoup/bs4/doc/)

```bash
pip install beautifulsoup4
```

+ Mechanize: this is the 'browser' the script uses. (http://wwwsearch.sourceforge.net/mechanize/)

```bash
pip install mechanize
```

+ MySQLdb: this connects to MySQL. **Version 1.2.3 Required** (http://mysql-python.sourceforge.net/MySQLdb.html)

```bash
pip install mysql-python==1.2.3
```


#### Configuring mySQL

Still with me? Good! The hardest part is done. From here we will need to set up the database and tables for MySQL. Since I'm such a swell guy, below you will find the instructions for setting these up from scratch. You should be able to copy/paste most of this and just run it to get going. All of this will be run from the mySQL command line (http://dev.mysql.com/doc/refman/5.6/en/mysql.html).


This will set up the database and the user.

```sql
create database mturk;
```

```sql
grant usage on *.* to mturk@localhost identified by 'mturk';
```

```sql
grant all privileges on mturk.* to mturk@localhost;
```

You should be able to test the new user by running the following using a console, after exiting your mySQL session:

```bash
mysql -u mturk -p'mturk' mturk
```

This will set up the tables.

```sql
CREATE TABLE hitdb (hitId VARCHAR(100), date DATE, requesterName VARCHAR(100), requesterId VARCHAR(50), title VARCHAR(200), reward FLOAT, status VARCHAR(100), feedback VARCHAR(200), workerId VARCHAR(50));
```

```sql
ALTER TABLE hitdb ADD PRIMARY KEY (hitId);
```

```sql
CREATE TABLE workerdb (workerId VARCHAR(50), workerName VARCHAR(50), bonus FLOAT, transfer FLOAT);
```

```sql
ALTER TABLE workerdb ADD PRIMARY KEY (workerId);
```
