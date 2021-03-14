#!/bin/bash  

docker exec -ti prestadock_app_dev_1 bash -c "rm -rf install && rm docker-compose.yml && mv docker-compose-ps.yml docker-compose.yml"

### restart you containers
docker-compose down --remove-orphans && docker-compose up -d

echo "part 2 done :)"
echo "from now on you can run normally 'docker-compose up -d'"
