FROM quay.io/fedora/fedora-silverblue:41

## Copy stuff
COPY scripts/ /build-chondro/scripts/
COPY files/ /build-chondro/files/

## Configure base
RUN chmod +x /build-chondro/scripts/*/*
RUN ./build-chondro/scripts/system/setup-dnf-config.sh
RUN ./build-chondro/scripts/apps/remove-browser-firefox.sh
RUN ./build-chondro/scripts/apps/remove-gnome-bloat.sh
RUN ./build-chondro/scripts/system/setup-base-config.sh
RUN ./build-chondro/scripts/system/setup-virtualization.sh

## Install fonts and obk
RUN ./build-chondro/scripts/system/setup-multilang.sh
RUN dnf install -y "/build-chondro/files/ibus-openbangla_3.0.0-F41.rpm" --allowerasing

## Install extra stuff
RUN ./build-chondro/scripts/apps/install-syncthing.sh
RUN ./build-chondro/scripts/apps/install-browser-chromium.sh

## Enable comeposefs
#RUN ./build-chondro/scripts/system/setup-composefs.sh

## Cleanup
RUN rm -rf /build-chondro

## Update
RUN rpm-ostree update

## Commit to Registry
RUN ostree container commit
#RUN tree /usr/lib/modules && bootc container lint
