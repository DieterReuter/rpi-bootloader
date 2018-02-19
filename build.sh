#!/bin/bash
set -e

docker-compose -p rpibootloaderbuild build
docker-compose -p rpibootloaderbuild run builder
docker-compose -p rpibootloaderbuild down
