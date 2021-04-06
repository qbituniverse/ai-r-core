# ai-r-core

## [ai-r-core](/README.md)/[sample](/sample/sample.md)/run

### R Studio

Location: **sample/run/run-rstudio.sh**

#### R Studio Variables

```bash
dockerfile="Dockerfile-SAMPLE-rstudio"
image="qbituniverse/SAMPLE-rstudio:local"
container="SAMPLE-rstudio"
```

#### Start R Studio

```bash
# build image
docker build -t $image -f .cicd/docker/$dockerfile .

# create container
docker run --name $container -d -p 8012:8787 -v $container:/home/rstudio -e DISABLE_AUTH=true $image

# launch R Studio
start http://localhost:8012
```

#### Pause and Restart R Studio

```bash
docker start $container
docker stop $container
docker exec -it $container bash
```

#### Pull Code Down from R Studio

```bash
docker cp $container:/home/rstudio/code/. ./src/model/code/
docker cp $container:/home/rstudio/input/. ./src/model/input/
docker cp $container:/home/rstudio/output/. ./src/model/output/
docker cp $container:/home/rstudio/models/. ./src/model/models/
```

#### Clean-up R Studio

```bash
docker rm -fv $container
docker volume rm -f $container
docker rmi -f $image
```

### R Api

Location: **sample/run/run-rapi.sh**

#### R Api Variables

```bash
dockerfile="Dockerfile-SAMPLE-api"
image="qbituniverse/SAMPLE-api:local"
container="SAMPLE-api"
network="SAMPLE-bridge"
```

#### Start R Api

```bash
# build image
docker build -t $image -f .cicd/docker/$dockerfile .

# create network & container
docker network create $network
docker run --name $container -d -p 8011:8000 --network=$network $image

# test API
start http://localhost:8011/api/ping
```

#### Pause and Restart R Api

```bash
docker start $container
docker stop $container
docker exec -it $container bash
```

#### Clean-up R Api

```bash
docker rm -fv $container
docker volume rm -f $container
docker rmi -f $image
docker network rm $network
```