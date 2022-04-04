# Simple Machines© Forum on Docker

This deploys SMF in Docker for development and testing purposes.

My use cases:

- test community modifications
- develop my own modifications

## Usage

Just run `make`. This will deploy and configure SMF. Check the `Makefile` for other options.

To access your new SMF instance, navigate to `http://localhost` and log in to the default Administrator account with: `admin:password`.

You can customize some parameters by cloning the file `.env.example` to `.env`.

## Disclaimer

This is not affiliated with Simple Machines©. Make sure you read Simple Machines© licenses and other documentation before using this.
