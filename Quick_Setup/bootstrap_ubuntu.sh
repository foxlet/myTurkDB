echo Setting up compiling tools

sudo apt-get install build-essential

echo Installing Python and related libraries...

sudo apt-get install python python-dev

echo Downloading Pip...

wget https://bootstrap.pypa.io/get-pip.py

echo Type your password to allow Python to load Pip and dependencies.

sudo python get-pip.py

sudo pip install beautifulsoup4

sudo pip install mechanize

echo Setting up MySQL...

sudo apt-get install mysql-server mysql-client-core-5.5 libmysqlclient-dev


touch .bash_login

echo Setting up SQL Client...

export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

sudo pip install mysql-python==1.2.3

#echo You can start the server from the SQL Panel that will open...

sudo service mysql restart

sh sql_ubuntu.sh

echo Setup is done.
