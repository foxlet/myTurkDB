echo Please accept the Xcode tools license.

sudo xcodebuild -license

function err_handle {
  echo "Please check that Xcode and its Command Line tools are installed"
  exit 0
}

echo Downloading Pip...

curl -OL https://bootstrap.pypa.io/get-pip.py

echo Type your password to allow Python to load Pip and dependencies.

sudo python get-pip.py

sudo pip install beautifulsoup4

sudo pip install mechanize

echo Downloading MySQL...

curl -OL http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.19-osx10.7-x86_64.dmg

hdiutil attach mysql-5.6.19-osx10.7-x86_64.dmg

echo Installing MySQL...

sudo installer -pkg /Volumes/mysql-5.6.19-osx10.7-x86_64/mysql-5.6.19-osx10.7-x86_64.pkg -target /

sudo installer -pkg /Volumes/mysql-5.6.19-osx10.7-x86_64/MySQLStartupItem.pkg -target /

cp -R /Volumes/mysql-5.6.19-osx10.7-x86_64/MySQL.prefPane ~/Library/PreferencePanes/

sudo chown root:wheel /Library/StartupItems/MySQLCOM *

touch .bash_login

echo Setting up environment...

export set MYSQL_HOME=/usr/local/mysql-5.6.19-osx10.7-x86_64

export set PATH=$PATH:$MYSQL_HOME/bin

alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'

alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'

export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

sudo ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future pip install mysql-python

sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib

#echo You can start the server from the SQL Panel that will open...

#open ~/Library/PreferencePanes/MySQL.prefPane/

mysqlstart

sh sql_osx.sh

echo Setup is done.
