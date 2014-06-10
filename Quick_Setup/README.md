Quick Setup Scripts for myTurkDB
========

These  are platform-specific scripts to help setup an user's environment for myTurkDB

### Quick Setup on Mac OS X

##### Requisites

+ A Mac running OS X 10.8.5 or later
+ Python 2.7.2 or later (already ships with OS X 10.8.5+)
+ Xcode 5.1.1 or later
+ The Xcode Command Line tools (can be installed from Xcode Preferences)

##### Installation

The quick setup script for Mac OS X can be ran with `sh bootstrap_osx.sh`

The script will automatically download all the necessary Python dependencies if needed.
MySQL will also be automatically downloaded and installed for OS X, as well as the myTurkBD tables.

##### Tested Versions and known issues

Quick Setup for OS X has been tested on 

+ Mac OS X Yosemite - 10.10 (Build 14A238x) - Python 2.7.6
⋅⋅* The script may fail at installing the MySQL Startup Item. This will not impact myTurkDB, but you will have to manually start up MySQL every time you reboot.
