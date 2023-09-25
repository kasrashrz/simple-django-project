#!/bin/bash
# Wait for MySQL to start
until mysqladmin ping -hdb -uroot -proot --silent; do
  echo 'Waiting for MySQL to start...'
  sleep 1
done

# Log in to MySQL and source the SQL file
mysql -hdb -u root -proot < /docker-entrypoint-initdb.d/world.sql
