#!/bin/bash

# installing repo

sudo yum install -y http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
sudo yum install -y postgresql93-server postgresql93-contrib 

# configuring and start db
sudo service postgresql-9.3 initdb
sudo chkconfig postgresql-9.3 on 
sudo service postgresql-9.3 start

CONF_DIR="/var/lib/pgsql/9.3/data/"
PG_CONF=${CONF_DIR}postgresql.conf
PG_HBA=${CONF_DIR}pg_hba.conf

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "${PG_CONF}"

# we trust to all, because this is our local development VM
echo "host     all             all             all                     trust" >> "${PG_HBA}"

sudo service postgresql-9.3 restart

echo "Postgresql successfully installed"
