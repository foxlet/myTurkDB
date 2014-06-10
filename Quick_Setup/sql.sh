export set MYSQL_HOME=/usr/local/mysql-5.6.19-osx10.7-x86_64

export set PATH=$PATH:$MYSQL_HOME/bin

alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'

alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'

cat setup.sql | mysql -uroot 

cat tables.sql |  mysql -u mturk -p'mturk' mturk
