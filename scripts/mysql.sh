#!/usr/bin/env bash

set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MYSQL_DIR=$DIR/../mysql
DATA_DIR=$MYSQL_DIR/data
DOCKER_DIR=$MYSQL_DIR/docker
PASSWORD=`grep MYSQL_PASSWORD $DIR/../SECRETS.yaml | cut -d : -f 2 | tr -d '[:space:]'`

mkdir -p $DATA_DIR

docker run -d \
    -p 3307:3306 \
    -v $DATA_DIR:/var/lib/mysql \
    --restart=always \
    --name kpcd_mysql \
    -e MYSQL_ROOT_PASSWORD=$PASSWORD \
    mysql:5.7.22
