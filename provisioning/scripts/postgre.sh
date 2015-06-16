echo "Install postgresql"
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -qq -y update
sudo apt-get -qq -y install postgresql-common
sudo apt-get -qq -y install postgresql-9.3 libpq-dev

echo "Set postgre password"
sudo -u postgres psql -c"ALTER user postgres WITH PASSWORD 'postgres'"
sudo service postgresql restart
