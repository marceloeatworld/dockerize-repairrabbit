# Dockerize RepairRabbit

### Prerequisites : 
- docker >= 18.03.0 - [installation guide](https://docs.docker.com/engine/install/)

- docker-compose >= 1.18.0 - [installation guide](https://docs.docker.com/compose/install/)


`docker` and `docker-compose` are only requirement to dockerize repairrabbit, Rest of the all dependencies will be insatted by dockerfile.

Let's start to dockerize repairrabbit

1. Go to your project root dir. For ex. `/var/www/html`
2. now copy `docker-coompose.yml`, `Dockerfile`, `setup.sh` and `vhost.conf` to your project root.
3. RUN `cp .env.example .env`
4. open `.env` file and set configuration
5. RUN `sh setup.sh` 