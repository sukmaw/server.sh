#!/bin/bash

# Default Node.js version
NODE_VERSION=18

# Parse command-line arguments
for arg in "$@"; do
  case $arg in
    --node-version=*)
      NODE_VERSION="${arg#*=}"
      shift # Remove --node-version= from processing
      ;;
    *)
      echo "Unknown option: $arg"
      exit 1
      ;;
  esac
done

function init() {
  echo "Initializing the necessary packages..." && \
  sudo apt-get update -y && \
  sudo apt-get upgrade -y && \
  sudo apt-get install build-essential -y && \
  sudo apt-get install unzip -y && \
  sudo apt-get install redis -y && \
  sudo apt-get install nginx -y && \
  sudo apt-get install certbot python3-certbot-nginx -y && \

  echo "Installing Node.js version $NODE_VERSION using NVM..." && \
  
  # Install NVM (Node Version Manager)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash && \
  export NVM_DIR="$HOME/.nvm" && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
  
  # Install specified Node.js version with NVM
  nvm install "$NODE_VERSION" && \
  nvm use "$NODE_VERSION" && \
  nvm alias default "$NODE_VERSION" && \

  echo "Setup complete!"
}

# Run the init function
init

