#!/usr/bin/env bash
set -ouex pipefail

dnf install -y chromium --allowerasing
sed -i '/^Exec=/ s/%U/--enable-features=AcceleratedVideoDecodeLinuxGL %U/' /usr/share/applications/chromium-browser.desktop