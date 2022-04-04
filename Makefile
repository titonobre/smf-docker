.DEFAULT_GOAL: default

.PHONY: setup

default: clean build start setup

# Builds the Docker Images
build:
	docker compose build

# Starts the Docker containers for SMf and phpMyAdmin
start: 
	docker compose up -d smf phpmyadmin

# Runs the SMF configuration script
setup:
	docker-compose run --rm setup

# Stops the Docker containers
stop:
	docker-compose stop

# Destroys the Docker containers and volumes
clean:
	docker-compose down --remove-orphans --volumes
