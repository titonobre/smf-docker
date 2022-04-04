#!/bin/sh

set -e

echo "Configuring SMF Database..."

curl "http://${SMF_HOST}/install.php?step=2" \
  --data-urlencode "db_type=mysql" \
  --data-urlencode "db_server=${DB_HOST}" \
  --data-urlencode "db_port=" \
  --data-urlencode "db_user=${DB_USER}" \
  --data-urlencode "db_passwd=${DB_PASSWORD}" \
  --data-urlencode "db_name=smf" \
  --data-urlencode "db_prefix=" \
  --silent \
  --show-error \
  --fail \
  --output /dev/null

echo "Configuring SMF Settings..."

curl "http://${SMF_HOST}/install.php?step=3" \
  --data-urlencode "mbname=${SMF_NAME:-My Comunity}" \
  --data-urlencode "boardurl=${SMF_PUBLIC_URL}" \
  --data-urlencode "reg_mode=0" \
  --data-urlencode "compress=on" \
  --data-urlencode "dbsession=on" \
  --data-urlencode "stats=on" \
  --silent \
  --show-error \
  --fail \
  --output /dev/null

echo "SMF Database Created."

curl "http://${SMF_HOST}/install.php?step=4" \
  --data-urlencode "pop_done=1" \
  --silent \
  --show-error \
  --fail \
  --output /dev/null

echo "Creating SMF Administrator..."

curl "http://${SMF_HOST}/install.php?step=5" \
  --data-urlencode "username=${SMF_ADMIN_USER:-admin}" \
  --data-urlencode "password1=${SMF_ADMIN_PASSWORD:-password}" \
  --data-urlencode "password2=${SMF_ADMIN_PASSWORD:-password}" \
  --data-urlencode "email=${SMF_ADMIN_EMAIL:-mail@example.com}" \
  --data-urlencode "server_email=${SMF_SERVER_EMAIL:-mail@example.com}" \
  --data-urlencode "contbutt=Continue" \
  --silent \
  --show-error \
  --fail \
  --output /dev/null

echo "Removing Install Script..."

curl "http://${SMF_HOST}/install.php?delete=1" \
  --silent \
  --show-error \
  --fail \
  --output /dev/null
