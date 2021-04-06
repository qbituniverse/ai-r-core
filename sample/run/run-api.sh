#############################################################################
# SAMPLE R Api
#############################################################################
# variables
dockerfile="Dockerfile-SAMPLE-api"
image="qbituniverse/SAMPLE-api:local"
container="SAMPLE-api"
network="SAMPLE-bridge"

#############################################################################
# Create, configure and work with R Api
#############################################################################
# build image
docker build -t $image -f .cicd/docker/$dockerfile .

# create network & container
docker network create $network
docker run --name $container -d -p 8011:8000 --network=$network $image

# test API
start http://localhost:8011/api/ping

#############################################################################
# Container operations
#############################################################################
# start, stop, exec
docker start $container
docker stop $container
docker exec -it $container bash

#############################################################################
# Clean-up
#############################################################################
docker rm -fv $container
docker volume rm -f $container
docker rmi -f $image
docker network rm $network