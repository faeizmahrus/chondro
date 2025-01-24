FROM quay.io/fedora/fedora-silverblue:41

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:stable
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

## Copy stuff
COPY scripts /tmp/scripts
COPY files /tmp/files

## Run stuff
RUN chmod +x /tmp/scripts/*
RUN /tmp/scripts/setup-base-config.sh
RUN /tmp/scripts/setup-virtualization.sh
RUN /tmp/scripts/setup-multilang.sh
RUN /tmp/scripts/setup-openbangla-keyboard.sh

RUN /tmp/scripts/install-syncthing.sh && \
    /tmp/scripts/install-browser-chromium.sh && \
    /tmp/scripts/remove-browser-firefox.sh

## Commit to Registry
RUN ostree container commit && bootc container lint
