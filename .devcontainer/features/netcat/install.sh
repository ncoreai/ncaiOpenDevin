#!/bin/bash

set -e

echo "Installing Netcat..."
sudo apt-get update -y
sudo apt-get install -y netcat
echo "Netcat installed successfully!"
