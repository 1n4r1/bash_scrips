#!/bin/bash

### script to add user with no interactive way
adduser --quiet --disabled-password --shell /bin/bash --home /home/testuser --gecos "User" testuser
echo "testuser:testpass" | chpasswd
