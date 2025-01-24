FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Run stuff
RUN chmod +x /build-chondro/scripts/system/* && \
    ./build-chondro/scripts/system/setup-dnf-config.sh && \
    ./build-chondro/scripts/system/setup-base-config.sh && \
    ./build-chondro/scripts/system/setup-virtualization.sh
RUN ./build-chondro/scripts/system/setup-multilang.sh && \
    dnf install -y "/build-chondro/files/ibus-openbangla_3.0.0-F41.rpm"

RUN ./build-chondro/scripts/system/install-syncthing.sh && \
    ./build-chondro/scripts/system/install-browser-chromium.sh && \
    ./build-chondro/scripts/system/remove-browser-firefox.sh && \
    ./build-chondro/scripts/system/remove-gnome-bloat.sh

RUN ./build-chondro/scripts/system/fix-composefs-error.sh

## Cleanup
RUN rm -rf /build-chondro
## Commit to Registry
RUN ostree container commit && tree /usr/lib/modules && bootc container lint
