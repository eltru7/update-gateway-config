#!/usr/bin/env bash -

UPDATED_IP=$(ipconfig getifaddr en0)

#(?<=\n)(.*?)(?= local)
#(?<=the)(.*?)(?=interface)

sed -i "" -E 's/^(?:[0-9]{1,3}\.){3}[0-9]{1,3} local./'${UPDATED_IP}'/g' /private/etc/hosts

ROOT_DIR=$(dirname "${DIR}")
GATEWAY_DIR_NAME="unifika-gateway"
GATEWAY_DIR="${ROOT_DIR}/${GATEWAY_DIR_NAME}"

cd GATEWAY_DIR
docker-compose down
docker-compose -f docker-compose-development.yml up -d gateway