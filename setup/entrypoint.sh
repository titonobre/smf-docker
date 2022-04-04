#!/bin/sh

echo "Waiting for Database..."

sh ./wait-for ${DB_HOST}:${DB_PORT} -t 30 -- sh setup-smf.sh
