#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"
sudo apt-get update -q
sudo apt-get -y install lxc-docker 
sudo apt-get -y install postgresql-client-9.3
#sudo apt-get -y install postgresql-9.3
#sudo apt-get -y install postgresql-contrib-9.3
#sudo apt-get -y install libpq-dev 
#sudo -u postgres createuser vagrant -s 
#sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD 'vagrantpw';"
#sudo -u postgres createdb -O vagrant vagrant
#sudo -u postgres echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

su - vagrant -c"curl -sSL https://get.rvm.io | bash -s stable"
su - vagrant -c"rvm requirements"
su - vagrant -c"rvm install 2.1.2"
su - vagrant -c"gem install bundler --no-ri --no-rdoc"

su - vagrant -c"mkdir -p /home/vagrant/workspace"

sudo apt-get -y install build-essential
cd /opt
wget https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.bz2
bzip2 -d -c util-linux-2.24.tar.bz2 | tar xvf -
cd util-linux-2.24
./configure --without-ncurses
make
make install
