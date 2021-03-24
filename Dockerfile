#
# Nextcloud +SMB Dockerfile
#
# https://github.com/BKhenloo/nextcloud_apache_smb
#

# Pull base image
FROM nextcloud:stable-apache

# Install smbclient
RUN apt-get update && \
    apt-get install -y procps smbclient && \
    rm -rf /var/lib/apt/lists/* 
