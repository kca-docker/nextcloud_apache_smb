#
# Nextcloud +SMB Dockerfile
#
# https://github.com/BKhenloo/nextcloud_apache_smb
#

# Pull base image.
FROM nextcloud:apache

# Install MariaDB.
RUN apt-get update && \
    apt-get install -y procps smbclient && \
    rm -rf /var/lib/apt/lists/* 
