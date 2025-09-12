#
# Nextcloud +SMB Dockerfile
#
# https://github.com/BKhenloo/nextcloud_apache_smb
#

ARG VERSION=apache

# Pull base image
FROM nextcloud:${VERSION}

ARG CREATED="RFC 3339 date-time"
ARG REVISION="sourceID"

## Fix information
LABEL org.opencontainers.image.url="https://hub.docker.com/r/bksolutions/nextcloud" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/bksolutions/nextcloud" \
      org.opencontainers.image.source="https://github.com/kca-docker/nextcloud_apache_smb" \
      org.opencontainers.image.title="Nextcloud" \
      org.opencontainers.image.description="Nextcloud with SMB" \
      org.opencontainers.image.authors="bksolutions"

## 
LABEL org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}-smb" \
      org.opencontainers.image.created="${CREATED}" 

# Install smbclient
RUN apt-get update && \
    apt-get install -y procps smbclient && \
    rm -rf /var/lib/apt/lists/* 
