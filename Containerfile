FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Run stuff
RUN chmod +x /build-chondro/scripts/system/* && \
    ./build-chondro/scripts/system/setup-base-config.sh && \
    ./build-chondro/scripts/system/setup-virtualization.sh
RUN ./build-chondro/scripts/system/setup-multilang.sh && \
    ./build-chondro/scripts/system/setup-openbangla-keyboard.sh

RUN ./build-chondro/scripts/system/install-syncthing.sh && \
    ./build-chondro/scripts/system/install-browser-chromium.sh && \
    ./build-chondro/scripts/system/remove-browser-firefox.sh

## Cleanup
RUN rm -rf /build-chondro
## Commit to Registry
RUN ostree container commit && bootc container lint
