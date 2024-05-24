#!/bin/bash

set -e

SQLITE_VERSION=${VERSION:-"3350000"}

if [ "$SQLITE_VERSION" = "3350000" ]; then
    echo "Installing SQLite version 3.35..."
    sudo apt-get update -y
    sudo apt-get install -y wget build-essential
    wget https://www.sqlite.org/2021/sqlite-autoconf-3350000.tar.gz
    tar xzf sqlite-autoconf-3350000.tar.gz
    cd sqlite-autoconf-3350000
    ./configure
    make
    sudo make install
    cd ..
    rm -rf sqlite-autoconf-3350000 sqlite-autoconf-3350000.tar.gz
else
    echo "Installing SQLite version $SQLITE_VERSION..."
    sudo apt-get update -y
    sudo apt-get install -y wget build-essential
    wget https://www.sqlite.org/2023/sqlite-autoconf-$SQLITE_VERSION.tar.gz
    tar xzf sqlite-autoconf-$SQLITE_VERSION.tar.gz
    cd sqlite-autoconf-$SQLITE_VERSION
    ./configure
    make
    sudo make install
    cd ..
    rm -rf sqlite-autoconf-$SQLITE_VERSION sqlite-autoconf-$SQLITE_VERSION.tar.gz
fi

echo "SQLite installed successfully!"
