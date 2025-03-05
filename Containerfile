FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Configure base
RUN chmod +x /build-chondro/scripts/*
RUN repo-add-rpmfusion.sh
RUN rpm-add-codecs.sh
RUN rpm-add-intel-drivers.sh
RUN rpm-add-mesa-drivers.sh
RUN rpm-add-langpacks-bn.sh
RUN rpm-add-shells.sh
RUN rpm-add-utils.sh
RUN rpm-swap-browsers.sh
RUN rpm-add-firewall-config.sh

## Cleanup
RUN rm -rf /build-chondro

## Commit to Registry
RUN ostree container commit
