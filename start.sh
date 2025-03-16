#!/bin/bash

cd
ROOT_PATH=`pwd`
N8N_ROOT=${ROOT_PATH}/n8n
DATA_FOLDER=${N8N_ROOT}/sqllite_data
# using 8082 as external port
EXTRENAL_PORT=8082
echo ${ROOT_PATH}

mkdir -p ${N8N_ROOT}
chmod 777 ${N8N_ROOT}
mkdir -p ${DATA_FOLDER}
chmod 777 ${DATA_FOLDER}

docker run -d --rm --name n8n -p ${EXTRENAL_PORT}:5678 -v ${DATA_FOLDER}:/home/node/.n8n -e N8N_SECURE_COOKIE=false -e NODE_TLS_REJECT_UNAUTHORIZED=0 docker.n8n.io/n8nio/n8n

echo "n8n accessable on port ${EXTRENAL_PORT}"