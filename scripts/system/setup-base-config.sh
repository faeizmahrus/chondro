#!/usr/bin/env bash
set -ouex pipefail

# Install rpmfusion repos
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf update -y
dnf install -y rpmfusion-free-release rpmfusion-nonfree-release --allowerasing
dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted
dnf config-manager --enable fedora-cisco-openh264
dnf update -y @core

# Install codec stuff
dnf install -y ffmpeg libdvdcss --allowerasing

# Install Intel Drivers
dnf install -y intel-media-driver libva-intel-driver

# Install AMD Drivers
dnf install -y mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld --allowerasing

# Install other stuff
dnf install -y fish zsh nu tcsh #Install shells
dnf install -y git distrobox syncthing #Install extras

# Refresh stuff that relies on GStreamer
dnf update -y @multimedia