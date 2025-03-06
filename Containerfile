FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Configure base
RUN chmod +x /build-chondro/scripts/*
RUN /build-chondro/scripts/repo-add-rpmfusion.sh
RUN /build-chondro/scripts/rpm-add-codecs.sh
RUN /build-chondro/scripts/rpm-add-intel-drivers.sh
RUN /build-chondro/scripts/rpm-add-mesa-drivers.sh
RUN /build-chondro/scripts/rpm-add-langpacks-bn.sh
RUN /build-chondro/scripts/rpm-add-shells.sh
RUN /build-chondro/scripts/rpm-add-utils.sh
RUN /build-chondro/scripts/rpm-swap-browsers.sh
RUN /build-chondro/scripts/rpm-add-firewall-config.sh

## Cleanup
RUN rm -rf /build-chondro

## Commit to Registry
RUN ostree container commit
