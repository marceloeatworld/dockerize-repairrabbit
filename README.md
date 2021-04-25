# Dockerize RepairRabbit

### Prerequisites
- PHP 7.2 
- COMPOSER 1.9.0
- docker >= 18.03.0 - [installation guide](https://docs.docker.com/engine/install/)

- docker-compose >= 1.18.0 - [installation guide](https://docs.docker.com/compose/install/)


`docker` and `docker-compose` are only requirement to dockerize repairrabbit, Rest of the all dependencies will be insatted by dockerfile.

### Setup
Let's start to dockerize repairrabbit
<span style="color:red">Before running this commands please read whole document carefully.</SPAN>

1. Go to your project root dir. e.g. `/var/www/html`
2. now copy `docker-coompose.yml`, `Dockerfile`, `setup.sh` and `vhost.conf` to your project root
3. RUN `cp .env.example .env`
4. open `.env` file and set configuration 
    By default all configuration has been set.Though here is the list of some variables which needs your attention once


    ``` env
    APP_NAME="Repairrabbit"
    APP_URL=https://repairshop.tech

    DB_PORT=3306
    DB_DATABASE="repairrabbit"
    DB_USERNAME="root"
    DB_PASSWORD="secret"
    ```  
    1. `APP_NAME` : set desired name
    2. `APP_URL` : your domain name. e.g.`https://repairshop.tech`
    3. `DB_PORT` : default will be `3306`, don't chnage unless you need to
    4. `DB_DATABASE` : default will be `repairrabbit`
    5. `DB_USERNAME` : default is `root`. set desired username
    6. `DB_PASSWORD` : default is `secret`. set desired pssword 
5. RUN `sh setup.sh` 
   - above command will ask you for `NGINX_PORT`, `APP_PORT`, `DB_PORT`, `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_ROOT_PASSWORD`.There is already default values are has been set.If you want to use default value then just press <kbd>Enter</kbd>.
   - <span style="color:red">Note : we already set database  configuration in step 4, so in both step configuration for database must be same,in step-4 and step-5 default values are same.If you haven't changes database configuration default values in previous step then don't chnage here too and if you chnaged then `DB_PORT` & `DB_PORT` ,`DB_DATABASE` & `MYSQL_DATABASE` , `DB_USERNAME` & `MYSQL_USER` , `DB_PASSWORD` & `MYSQL_USER` are must be same.</span> 
6. RUN `docker exec repairrabbit_app php artisan migrate --force `
7. RUN `docker exec repairrabbit_app php artisan db:seed --class=DataSeederSample --force`
 this will create admin user for your application which username : `admin@repairrabbit.co` and password : `123456` . You can change later from `settings` in admin panel

