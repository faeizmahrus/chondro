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
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Run stuff
RUN chmod +x /build-chondro/scripts/*
RUN ./build-chondro/scripts/setup-base-config.sh
RUN ./build-chondro/scripts/setup-virtualization.sh
RUN ./build-chondro/scripts/setup-multilang.sh
RUN ./build-chondro/scripts/setup-openbangla-keyboard.sh

RUN ./build-chondro/scripts/install-syncthing.sh && \
    ./build-chondro/scripts/install-browser-chromium.sh && \
    ./build-chondro/scripts/remove-browser-firefox.sh

## Commit to Registry
RUN ostree container commit && bootc container lint
