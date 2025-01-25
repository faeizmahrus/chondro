#!/usr/bin/env bash
set -ouex pipefail

# dnf tweaks
echo "installonly_limit = 1" >> /etc/dnf/dnf.conf # Fixes /usr/lib/modules error of bootc container lint
echo "max_parallel_downloads = 20" >> /etc/dnf/dnf.conf
echo "minrate = 262144" >> /etc/dnf/dnf.conf
echo "timeout = 5" >> /etc/dnf/dnf.conf

# Install core dnf plugins
dnf install -y dnf-plugins-core --allowerasing