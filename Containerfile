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
RUN mkdir -p /build-chondro /build-chondro/scripts /build-chondro/files/
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Run stuff
RUN chmod +x /build-chondro/scripts/system/*
RUN ./build-chondro/scripts/system/setup-base-config.sh
RUN ./build-chondro/scripts/system/setup-virtualization.sh
RUN ./build-chondro/scripts/system/setup-multilang.sh
RUN ./build-chondro/scripts/system/setup-openbangla-keyboard.sh

RUN ./build-chondro/scripts/system/install-syncthing.sh && \
    ./build-chondro/scripts/system/install-browser-chromium.sh && \
    ./build-chondro/scripts/system/remove-browser-firefox.sh


## Cleanup
RUN rm -rf /build-chondro
## Commit to Registry
RUN ostree container commit && bootc container lint
