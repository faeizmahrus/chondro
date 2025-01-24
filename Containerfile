FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Configure base
RUN chmod +x /build-chondro/scripts/*/* && \
    ./build-chondro/scripts/system/setup-dnf-config.sh && \
    ./build-chondro/scripts/apps/remove-browser-firefox.sh && \
    ./build-chondro/scripts/apps/remove-gnome-bloat.sh && \
    ./build-chondro/scripts/system/setup-base-config.sh && \
    ./build-chondro/scripts/system/setup-virtualization.sh

## Install fonts and obk
RUN ./build-chondro/scripts/system/setup-multilang.sh && \
    dnf install -y "/build-chondro/files/ibus-openbangla_3.0.0-F41.rpm"

## Install extra stuff
RUN ./build-chondro/scripts/apps/install-syncthing.sh && \
    ./build-chondro/scripts/apps/install-browser-chromium.sh

## Fix comeposefs error
#RUN ./build-chondro/scripts/fixes/fix-composefs-error.sh

## Cleanup
RUN rm -rf /build-chondro

## Commit to Registry
RUN ostree container commit
