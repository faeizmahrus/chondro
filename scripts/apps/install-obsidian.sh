#!/usr/bin/env bash
set -ouex pipefail

curl -L -o 'onlyoffice-x64.rpm' 'https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm'
dnf install -y onlyoffice-x64.rpm --allowerasing
rm -f onlyoffice-x64.rpm
#sed -i '/^Exec=/ s/%U/--enable-features=AcceleratedVideoDecodeLinuxGL %U/' /usr/share/applications/chromium-browser.desktop