@echo off

@echo Setting up MySQL Installer

START /wait msiexec /i mysql-installer-community-5.6.19.0.msi /quiet

@echo Installing MySQL 5.6

START /wait "" "C:\Program Files (x86)\MySQL\MySQL Installer\MySQLInstallerConsole.exe" --config=mysql-server-5.6-win32:passwd=root --product=* --catalog=mysql-5.6-win32 --action=install --type=full

SET PATH=%PATH%;"C:\Program Files (x86)\MySQL\MySQL Server 5.6\bin"

@echo Finished installing MySQL!

@echo Installing Python 2.7.6

START /wait msiexec /i python-2.7.6.msi /passive

SET PATH=%PATH%;C:\Python27\

@echo Finished installing Python!

@echo Installing PIP

python get-pip.py

@echo Finished installing PIP

SET PATH=%PATH%;C:\Python27\scripts\

@echo Installing Beautiful Soup Module

pip install beautifulsoup4

@echo Installing Mechanize Module

pip install mechanize

@echo Installing MySQL-Python Module

REM START /wait MySQL-python-1.2.5.win32-py2.7.exe

easy_install mysql-python

mysql -uroot -proot -e "CREATE DATABASE mturk; GRANT USAGE ON *.* to mturk@localhost IDENTIFIED BY 'mturk'; GRANT ALL PRIVILEGES ON mturk.* TO mturk@localhost;"

mysql -uroot -proot -e "USE mturk; CREATE TABLE hitdb (hitId VARCHAR(100), date DATE, requesterName VARCHAR(100), requesterId VARCHAR(50), title VARCHAR(200), reward FLOAT, status VARCHAR(100), feedback VARCHAR(200), workerId VARCHAR(50))"

mysql -uroot -proot -e "USE mturk; ALTER TABLE hitdb ADD PRIMARY KEY (hitId)"

mysql -uroot -proot -e "USE mturk; CREATE TABLE workerdb (workerId VARCHAR(50), workerName VARCHAR(50), bonus FLOAT, transfer FLOAT)"

mysql -uroot -proot -e "USE mturk; ALTER TABLE workerdb ADD PRIMARY KEY (workerId)"