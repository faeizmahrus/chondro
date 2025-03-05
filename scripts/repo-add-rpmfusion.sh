#!/bin/bash
FEDORAVER=41
rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$FEDORAVER".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$FEDORAVER".noarch.rpm
rpm-ostree update --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release --install rpmfusion-free-release --install rpmfusion-nonfree-release
rpm-ostree install rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted