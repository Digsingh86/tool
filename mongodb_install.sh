#!/bin/bash


######## Run this bash script with to install Mongodb on your system ##########


# Add an appropriate username for your MongoDB user
USR="admin"
# Add an appropriate password for your MongoDB user. Password should be ideally read from a config.ini file, keeping passwords in bash scripts is not secure.
PASS="password123"
DB="admin"
ROLE="root"
BIND_IP=0.0.0.0
# Perform System Update

sudo apt update -y
sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release

# Importing the Public Key


echo ""
echo "Creating source list file mongodb"
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
sudo apt update -y

#Configure MongoDB Repo
echo ""
echo "Configure mongodb repo"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list


#Install MongoDB 6.0 



echo ""
echo "Installing mongodb-org"
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
sudo dpkg -i ./libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
sudo apt update -y
sudo apt install mongodb-org -y


echo ""
echo "Making a directory for db data"
sudo mkdir -p /data/db 

 

 
# Start MongoDB and add it as a service to be started at boot time:
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl restart mongod

echo ""
echo " ############################## Mongodb has been installed  ###############################"
echo " ##      Check status of mongod server by running this command: sudo netstat -plntu      ##"
echo " ##########################################################################################"

export LC_ALL=C


echo ""
echo "Creating mongodb user"
mongo admin --eval "db.createUser({'user':'$USR', 'pwd':'$PASS', 'roles':[{'role':'$ROLE', 'db':'$DB'}]})"


sudo systemctl stop mongod


echo ""
echo "Configuring the mongod.conf file to update bindip and enable authentication"
sudo sed -i[bindIp] "s/bindIp: /bindIp: $BIND_IP #/g" /etc/mongod.conf 
# Do not enable ip_bind_all without enabling authorization. otherwise, the db will be exposed.
sudo echo  "#authorization config
security:
   authorization: enabled" >> /etc/mongod.conf


echo ""
echo "Appending --auth to mongod.service to enable authentication"
sudo sed -i '/ExecStart/ s/$/ --auth/' /lib/systemd/system/mongod.service

sudo systemctl enable mongod.service


echo ""
echo "Initiating daemon-reload"
sudo systemctl daemon-reload


sudo service mongod stop


echo ""
echo "Starting the mongod server with the following parameters:"
echo "sudo mongod --bind_ip_all --fork --logpath /var/log/mongodb.log"
sudo mongod --bind_ip $BIND_IP --fork --logpath /var/log/mongodb.log


echo "Starting the mongo shell with following parameters:"
echo "mongo -u $USR -p $PASS"
mongo -u $USR -p $PASS 



echo "You can connect to this db from remote client using: mongo --username $USR --password $PASS ipaddress:27017/db_name --authenticationDatabase $DB"
