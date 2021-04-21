#!/bin/sh

echo "======================= Provide few details to get started Or press ENTER for default value ======================="

nginxPort=80
echo "Which port should be used for NGINX server?"
echo "  - $nginxPort"
echo "NGINX_PORT : [$nginxPort] \c"
read newNginxPort
[ -n "$newNginxPort" ] && nginxPort=$newNginxPort
echo "\n"

appPort=9000
echo "Which port should be used for APP server?"
echo "  - $appPort"
echo "APP_PORT : [$appPort] \c"
read newappPort
[ -n "$newappPort" ] && appPort=$newappPort
echo "\n"

dbPort=33061
echo "Which port should be used for DATABASE server?"
echo "  - $dbPort"
echo "DB_PORT : [$dbPort] \c"
read newDbPort
[ -n "$newDbPort" ] && dbPort=$newDbPort
echo "\n"

dbName=repairrabbit
echo "What should be the name of database?"
echo "  - $dbName"
echo "MYSQL_DATABASE : [$dbName] \c"
read newDbName
[ -n "$newDbName" ] && dbName=$newDbName
echo "\n"

dbUser=root
echo "What should be the name of user for database?"
echo "  - $dbUser"
echo "MYSQL_USER : [$dbUser] \c"
read newDbUser
[ -n "$newDbUser" ] && dbUser=$newDbUser
echo "\n"

dbPwd=secret
echo "What should be the password for database?"
echo "  - $dbPwd"
echo "MYSQL_ROOT_PASSWORD : [$dbPwd] \c"
read -s newDbPwd
[ -n "$newDbPwd" ] && dbPwd=$newDbPwd

echo "\n"
echo "======================= Notedown below details ======================="
echo "\n"
echo "NGINX_PORT: $nginxPort"
echo "APP_PORT: $appPort"
echo "DB_PORT: $dbPort"
echo "\n"
echo "MYSQL_DATABASE: $dbName"
echo "MYSQL_USER: $dbUser"
echo "MYSQL_ROOT_PASSWORD: *****"
echo "\n"

echo "======================= RepairRabbit ======================="

export NGINX_PORT=$nginxPort
export APP_PORT=$appPort
export DB_PORT=$dbPort

export MYSQL_DATABASE=$dbName
export MYSQL_USER=$dbUser
export MYSQL_ROOT_PASSWORD=$dbPwd

if [ -n .env ]; then
	touch .env
	chmod 777 .env
fi

docker-compose up --build -d

chmod -R 777 storage/app/public/images
chmod -R 777 storage/app/public/invoice_pdf

docker exec repairrabbit_app php artisan storage:link

docker exec repairrabbit_app php artisan config:clear
docker exec repairrabbit_app php artisan cache:clear

name='repairrabbit_app'

matchingStarted=$(docker ps --filter="name=$name" -q | xargs)

if [ matchingStarted ]; then
	echo "======================= Application Started ======================="
fi