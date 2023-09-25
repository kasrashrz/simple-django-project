#!/bin/sh

#!/bin/sh

# Prompt for the MySQL root password interactively
read -sp "Enter MySQL root password: " root

# Import SQL file into MySQL using the provided password
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SOURCE /world.sql;"


# Import SQL file into MySQL
#mysql -u root -proot -e "SOURCE /world.sql;"
