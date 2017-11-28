#!/bin/bash
set -e

# Load the functions
source ./docker/functions.sh

# Set the hostname in the config files
<<<<<<< HEAD
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/crawl.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/twine-generate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/twine-correlate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/twine.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/twine-anansi.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME}|" /usr/etc/quilt.conf
=======
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-generate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-correlate.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/twine-anansi.conf
sed -i -e "s|ACROPOLIS_HOSTNAME|${ACROPOLIS_HOSTNAME-localhost}|" /usr/etc/quilt.conf
>>>>>>> 15f6147ffed8b21959db90f6bbea71afcada28da

# Wait for Postgres
wait_for_service postgres 5432

# Create the DB. They need to be all there before the init is triggered.
do_init=false
for db in anansi spindle cluster; do
	if db_exists ${db}; then
    	echo "$(date) - database ${db} exists"
	else
		echo "$(date) - creating database ${db}"
		create_db ${db};
		do_init=true
	fi
done

# Do all the init if needed
if [ "${do_init}" = true ] ; then
	echo "$(date) - need to initialise one or more databases"

	# Use twine to migrate the schema for 'spindle'
	echo "$(date) - doing schema migration with Twine"
<<<<<<< HEAD
	twine -c /usr/etc/twine.conf -S # >/dev/null 2>&1
=======
	twine -c /usr/etc/twine-generate.conf -S
>>>>>>> 15f6147ffed8b21959db90f6bbea71afcada28da
	wait_for_schema spindle com.github.bbcarchdev.spindle.twine 28

	# Use twine to migrate the schema for 'spindle'
	echo "$(date) - doing schema migration with Anansi"
<<<<<<< HEAD
	/usr/sbin/crawld -c /usr/etc/crawl.conf -S # >/dev/null 2>&1
=======
	/usr/sbin/crawld -c /usr/etc/crawl.conf -S
>>>>>>> 15f6147ffed8b21959db90f6bbea71afcada28da
	wait_for_schema anansi com.github.nevali.crawl.db 9

	# Use twine-writerd to migrate the schema of cluster
	echo "$(date) - spawning a writerd to init the cluster"
<<<<<<< HEAD
	twine-writerd -c /usr/etc/twine-generate.conf # >/dev/null 2>&1
	#wait_for_schema cluster com.github.bbcarchdev.libcluster 5
=======
	twine-writerd -c /usr/etc/twine-generate.conf
	# wait_for_schema cluster com.github.bbcarchdev.libcluster 5
>>>>>>> 15f6147ffed8b21959db90f6bbea71afcada28da

	# Ask the writerd to stop and wait until its process is gone
	kill -s SIGTERM `pidof twine-writerd`
	until [[ -z `pidof twine-writerd` ]]; do
	    echo "$(date) - wait for writerd to finish"
	    sleep 2
	done

	# Probably a first run so we print the doc too
	cat docker.md
fi

# Run the requested command
exec "$@"
