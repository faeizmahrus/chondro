#!/usr/bin/env bash
set -ouex pipefail

dnf config-manager addrepo --from-repofile=https://packages.microsoft.com/yumrepos/vscode/config.repo
dnf install -y code
#sed -i '/^Exec=/ s/%U/--enable-features=AcceleratedVideoDecodeLinuxGL %U/' /usr/share/applications/chromium-browser.desktop