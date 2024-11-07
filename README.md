# Server Initialization Script

This repository contains a script (`init.sh`) that automates the installation and setup of essential packages and configurations for a new server. The script is designed for Ubuntu and can be used on fresh installations.

## Features

- Installs essential packages: `build-essential`, `unzip`, `redis`, `nginx`, `certbot`, and more.
- Sets up Node.js using NVM (Node Version Manager) with a customizable Node.js version.
- Configures PostgreSQL (if desired, instructions for inclusion provided in the script).

## Prerequisites

- **Ubuntu OS**: The script is designed and tested for Ubuntu.
- **`curl` and `sudo`** installed (the script will attempt to install `curl` if not present).

## Usage

To run the script directly on your server, use the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/sukmaw/server.sh/main/init.sh -o init.sh && chmod +x init.sh && ./init.sh && source ~/.bashrc

