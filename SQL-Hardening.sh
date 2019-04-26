#!/bin/bash

apt-get update -y

apt-get update mysql-server -y

#All changes to mysqld.cnf requires a restart of the services

#Could also try this
#mysql_secure_installation

# Don't run mysql as the root user
#create a mysql user and use that

# in mysqld.cnf use the following details
bind-address=127.0.0.1

#to disable local file inclusion, it is very essential to remove 
# a user permission to read from a local filesystem
local_infile=0

#always disable symbolic links
#especially important in scenarios where mysql is running as root
symbolic-links=0

#Mysql user password expire after this interval
#Note that applications connecting will be disconnected and
#this needs to be reconfigured
default_password_lifetime = 90

#Audit check all the users available on mysql
#Create different passwords for them

#mysql> SELECT User, Host, Authentication_String FROM mysql.user;

#mysql> SET PASSWORD FOR 'test'@'localhost' = "uYI3cU_FreFgR*UsS2B";

#As a rule of thumb, drop the unwanted users
#mysql> DROP USER 'test'@'localhost';

#Rename the root user to something else
#mysql> RENAME USER 'root'@'localhost' TO new_username;

#As with the previous case, applications connecting with mysql will get disconnected

#Grant only specific permissions to users
#mysql> GRANT SELECT, INSERT, UPDATE, DELETE ON Test.* TO 'jason'@'localhost';

#Drop unwanted databases
#use mysql> show databases;
# To drop a database like test
# mysql> Drop database test;


#Log files in Databases
# Three main logs in databases
# General log files -> contains information regarding client connection/disconnection as well as all SQL queries received from clients
# general_log_file = /var/log/mysql/mysql.log
# general_log = 1

# Error logs
# contain information such as when the mysql daemon was started and stopped, as well as any critical errors that may have occurred during the daemon’s runtime.
# log_error = /var/log/mysql/error.log


# Slow/Long queries
# slow_query_log = 1
# slow_query_log_file = /var/log/mysql/mysql-slow.log
# long_query_time = 2

