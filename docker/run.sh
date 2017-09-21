#!/bin/bash
set -e

# Load the functions
source ./docker/functions.sh

# Set the hostname in the config files
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-generate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-correlate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-anansi.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/quilt.conf

echo "$(date) - RUN>SH: ACROPOLIS_HOSTNAME-localhost equals: ${ACROPOLIS_HOSTNAME-localhost}"

# Wait for Postgres
wait_for_service postgres 5432

# Check individual databases are initialised
wait_for_schema spindle com.github.bbcarchdev.spindle.twine 28
wait_for_schema anansi com.github.nevali.crawl.db 9
# wait_for_schema cluster com.github.bbcarchdev.libcluster 5

# Wait for S3
wait_for_service s3 80

# Wait for 4Store
wait_for_service fourstore 9000

# Ready!
echo "$(date) - services ready.."

# Run the requested command
exec "$@"
