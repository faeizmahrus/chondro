#!/usr/bin/env bash
set -ouex pipefail

# dnf tweaks
echo "installonly_limit = 1" >> /etc/dnf/dnf.conf # Fixes /usr/lib/modules error of bootc container lint
echo "max_parallel_downloads = 20" >> /etc/dnf/dnf.conf
echo "minrate = 262144" >> /etc/dnf/dnf.conf
echo "timeout = 5" >> /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf
# Install core dnf plugins
dnf install -y dnf-plugins-core

# Install rpmfusion repos
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf update -y
dnf install -y rpmfusion-free-release rpmfusion-nonfree-release --allowerasing
dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted
dnf config-manager setopt fedora-cisco-openh264.enabled=1
dnf install -y \*appstream-data

# Install codec stuff
dnf install -y ffmpeg libdvdcss --allowerasing

# Install Intel Drivers
dnf install -y intel-media-driver libva-intel-driver

# Install AMD Drivers
dnf install -y mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld --allowerasing

# Install additional firmware
dnf install -y \*-firmware

# Install other stuff
dnf install -y fish zsh nu tcsh #Install shells
dnf install -y git curl wget distrobox #Install extras

# Updoot
dnf update -y