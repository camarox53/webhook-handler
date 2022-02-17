#!/bin/bash
set -e

if [ "$(id -u)" = "0" ]; then
	# Set permissions on data directory - fixes permissions
	# on files if mounting from host 
	chown -R webhook:webhook /data
	
# Add call to gosu to drop from root user to webhook user
# when running original entrypoint
 	set -- gosu webhook "$@"
fi

# Replace current PID 1 with Original Entry Point 
exec "$@"
