#! /bin/bash
# Script to check and wait until the NeoScan service is operational. 

until $(curl --output /dev/null --silent --head --fail http://localhost:4000); do
    printf '.'
    sleep 3
done

printf "\n"